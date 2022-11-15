exports('install', function()
    return {
        uuid4 = UUID4,
        sha = SHA2,
        rc4 = {
            decrypt = RC4.decrypt,
            encrypt = RC4.encrypt
        },
        base64 = {
            decrypt = Base64.decrypt,
            encrypt = Base64.encrypt
        }
    }
end)

