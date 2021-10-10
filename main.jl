using DataPreProcessing, DataFrames

# Project constants
url = "https://archive.ics.uci.edu/ml/machine-learning-databases/housing/housing.data"
file_sha1 = UInt8[
    0xad, 0xfa, 0x6b, 0x6d, 0xca,
    0x24, 0xa6, 0x3f, 0xe1, 0x66,
    0xa9, 0xe7, 0xfa, 0x01, 0xce,
    0xe4, 0x33, 0x58, 0x57, 0xd1
]
metadata_url = "https://archive.ics.uci.edu/ml/machine-learning-databases/housing/housing.names"

csv_content = String(download_file(url, file_sha1))
csv_meta = String(download_file(metadata_url,))
println(csv_meta)