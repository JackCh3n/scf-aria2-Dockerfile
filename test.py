import aria2p

# initialization, these are the default values
aria2 = aria2p.API(
    aria2p.Client(
        host="http://127.0.0.1",
        port=6800,
        secret="Python_No.1"
    )
)

# list downloads
downloads = aria2.get_downloads()
print('----Test')
print(downloads)
print('----end')