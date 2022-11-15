-- https://en.wikipedia.org/wiki/RC4

local function swap( i, j )
    return j, i
end

local function rc4(key, input) 
    local S = {}
    for i = 0, 255 do
        S[ i ] = i
    end
    
    local j = 0
    for i = 0, 255 do
        j = ( j + S[ i ] + key:byte( i % #key + 1 ) ) % 256
        S[ i ], S[ j ] = swap( S[ i ], S[ j ] )
    end
    
    local out = ""
    
    local i, j = 0, 0
    for k = 1, #input do
        i = ( i + 1 ) % 256
        j = ( j + S[ i ] ) % 256
        S[ i ], S[ j ] = swap( S[ i ], S[ j ] )
    
        local K = S[ ( S[ i ] + S[ j ] ) % 256 ]
    
        out = out .. string.char( input:byte( i ) ~ K  )
    end
    
    return out
end


RC4 = {
    encrypt = rc4,
    decrypt = rc4
}