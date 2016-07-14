function trunc{T<:Union{Signed,Unsigned},P}(::Type{T}, x::BigFloat{P})
    (typemin(T) <= x <= typemax(T)) || throw(InexactError())
    unsafe_cast(T,x,RoundToZero)
end
function floor{T<:Union{Signed,Unsigned}, P}(::Type{T}, x::BigFloat{P})
    (typemin(T) <= x <= typemax(T)) || throw(InexactError())
    unsafe_cast(T,x,RoundDown)
end
function ceil{T<:Union{Signed,Unsigned}, P}(::Type{T}, x::BigFloat{P})
    (typemin(T) <= x <= typemax(T)) || throw(InexactError())
    unsafe_cast(T,x,RoundUp)
end

function round{T<:Union{Signed,Unsigned}, P}(::Type{T}, x::BigFloat{P})
    (typemin(T) <= x <= typemax(T)) || throw(InexactError())
    unsafe_cast(T,x,ROUNDING_MODE[end])
end


trunc{P}(::Type{BigInt}, x::BigFloat{P}) = unsafe_cast(BigInt, x, RoundToZero)
floor{P}(::Type{BigInt}, x::BigFloat{P}) = unsafe_cast(BigInt, x, RoundDown)
ceil{P}( ::Type{BigInt}, x::BigFloat{P}) = unsafe_cast(BigInt, x, RoundUp)
round{P}(::Type{BigInt}, x::BigFloat{P}) = unsafe_cast(BigInt, x, ROUNDING_MODE[end])

# convert/round/trunc/floor/ceil(Integer, x) should return a BigInt
trunc{P}(::Type{Integer}, x::BigFloat{P}) = trunc(BigInt, x)
floor{P}(::Type{Integer}, x::BigFloat{P}) = floor(BigInt, x)
ceil{P}(::Type{Integer}, x::BigFloat{P})  = ceil(BigInt, x)
round{P}(::Type{Integer}, x::BigFloat{P}) = round(BigInt, x)
