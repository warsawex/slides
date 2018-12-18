defmodule Downloader do
  @downloads_directory "downloads"

  defmacro __using__(args) do
    Application.ensure_all_started(:inets)
    Application.ensure_all_started(:ssl)

    remote_file = Keyword.fetch!(args, :file)
    local_file = Keyword.get(args, :local, UUID.uuid4())
    checksum = Keyword.fetch!(args, :checksum)

    download_file(remote_file, local_file, checksum)
  end

  defp download_file(remote_file, local_file, checksum) do
    file_path = Path.join(@downloads_directory, local_file)

    File.rm(file_path)

    {:ok, :saved_to_file} =
      :httpc.request(
        :get,
        {String.to_charlist(remote_file), []},
        [],
        body_format: :binary,
        stream: String.to_charlist(file_path),
        sync: true
      )

    if checksum(file_path) != checksum do
      IO.inspect(checksum(file_path))
      raise("Invalid checksum for downloaded file: #{file_path}")
    end
  end

  defp checksum(file_path) do
    %{size: size} = File.stat!(file_path)
    size
  end
end
