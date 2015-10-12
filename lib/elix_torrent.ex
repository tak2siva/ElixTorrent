defmodule ElixTorrent do
    @torrent_file "ubuntu-14.04.3-desktop-amd64.iso.torrent"

    def start(_type, _args) do
        IO.puts "Starting ElixTorrent"
        Task.start(read_torrent)
    end

    def read_torrent do
        meta_data = File.read @torrent_file
        parsed_data = elem(Bencode.decode(elem(meta_data,1)), 1)
        IO.inspect parsed_data

        hash = get_info_hash parsed_data
        IO.inspect hash
    end

    def get_info_hash(parsed_data) do
        info_bencode = elem(Bencode.encode(parsed_data["info"]), 1)
        info_sha = :crypto.hash :sha, info_bencode
        URI.encode_query %{"info_hash" => info_sha}
    end

end
