local export = {}
local gsub = mw.ustring.gsub
local match = mw.ustring.match

local conv = {
    ["क"] = "𑊺",
    ["ख"] = "𑊻",
    ["ग"] = "𑊼",
    ["ॻ"] = "𑊽",
    ["घ"] = "𑊾",
    ["ङ"] = "𑊿",
    ["च"] = "𑋀",
    ["छ"] = "𑋁",
    ["ज"] = "𑋂",
    ["ॼ"] = "𑋄",
    ["झ"] = "𑋄",
    ["ञ"] = "𑋅",
    ["ट"] = "𑋆",
    ["ठ"] = "𑋇",
    ["ड"] = "𑋈",
    ["ॾ"] = "𑋉",
    ["ढ"] = "𑋋",
    ["ण"] = "𑋌",
    ["त"] = "𑋍",
    ["थ"] = "𑋎",
    ["द"] = "𑋏",
    ["ध"] = "𑋐",
    ["न"] = "𑋑",
    ["प"] = "𑋒",
    ["फ"] = "𑋓",
    ["ब"] = "𑋔",
    ["ॿ"] = "𑋕",
    ["भ"] = "𑋖",
    ["म"] = "𑋗",
    ["य"] = "𑋘",
    ["र"] = "𑋙",
    ["ल"] = "𑋚",
    ["व"] = "𑋛",
    ["श"] = "𑋜",
    ["स"] = "𑋝",
    ["ह"] = "𑋞",
    ["ड़"] = "𑋊",
    ["ख़"] = "𑊻𑋩",
    ["ग़"] = "𑊼𑋩",
    ["क़"] = "𑊺𑋩",
    ["ज"] = "𑋂𑋩",

    ["ा"] = "𑋠",
    ["ि"] = "𑋡",
    ["ी"] = "𑋢",
    ["ु"] = "𑋣",
    ["ू"] = "𑋤",
    ["े"] = "𑋥",
    ["ै"] = "𑋦",
    ["ो"] = "𑋧",
    ["ौ"] = "𑋨",
    ["्"] = "𑋪",
    ["़"] = "𑋩",
    ["𑋈𑋩"] = "𑋊",

    -- vowels
    ["अ"] = "𑊰",
    ["आ"] = "𑊱",
    ["इ"] = "𑊲",
    ["ई"] = "𑊳",
    ["उ"] = "𑊴",
    ["ऊ"] = "𑊵",
    ["ए"] = "𑊶",
    ["ऐ"] = "𑊷",
    ["ओ"] = "𑊸",
    ["औ"] = "𑊹",

    -- anusvara    
    ["ं"] = "𑋟"
}
function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, ".़?", function(c) return conv[c] end)

    return text
end

return export
