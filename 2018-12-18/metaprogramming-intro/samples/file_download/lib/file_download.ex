defmodule FileDownload do
  use Downloader,
    file: "https://i.imgur.com/34uT9Qj.jpg",
    local: "cat.jpg",
    checksum: 36_528
end
