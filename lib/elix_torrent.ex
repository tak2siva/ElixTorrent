defmodule ElixTorrent do
    @torrent_file "ubuntu-14.04.3-desktop-amd64.iso.torrent"

    def start(_type, _args) do
        IO.puts "Starting ElixTorrent"
        Task.start(read_torrent)
    end

    def read_torrent do
        meta_data = File.read @torrent_file
        parsed_data = Bencode.decode elem(meta_data,1)
        IO.inspect elem(parsed_data, 1)
    end
end
