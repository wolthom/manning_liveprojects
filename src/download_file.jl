using Downloads, SHA

"""
This function takes:
    - an url as a string 
    - an optional SHA1 value to check against
    
It returns:
    - the file as a Vector{UInt8}

It throws:
    - ArgumentError if the SHA1 values do not match
"""
function download_file(url, file_sha1=Nothing)
    # Download file and get byte-vector
    buf = IOBuffer()
    Downloads.download(url, buf)
    out = take!(buf)

    # Check SHA1 if provided
    if file_sha1 != Nothing
        actual_sha1 = sha1(out)
        if file_sha1 != actual_sha1
            throw(ArgumentError("SHA1 value of file does not match specified value!"))
        end
    end

    return out
end