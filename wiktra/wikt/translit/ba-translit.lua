local export = {}

local tt = {
    ["ү"] = "ü",
    ["Ү"] = "Ü",
    ["т"] = "t",
    ["Т"] = "T",
    ["р"] = "r",
    ["Р"] = "R",
    ["ф"] = "f",
    ["Ф"] = "F",
    ["ө"] = "ö",
    ["Ө"] = "Ö",
    ["ю"] = "yu",
    ["Ю"] = "Yu",
    ["ш"] = "š",
    ["Ш"] = "Š",
    ["ь"] = "’",
    ["Ь"] = "’",
    ["ъ"] = "ʺ",
    ["Ъ"] = "ʺ",
    ["н"] = "n",
    ["Н"] = "N",
    ["п"] = "p",
    ["П"] = "P",
    ["й"] = "y",
    ["Й"] = "Y",
    ["л"] = "l",
    ["Л"] = "L",
    ["з"] = "z",
    ["З"] = "Z",
    ["е"] = "e",
    ["Е"] = "E",
    ["г"] = "g",
    ["Г"] = "G",
    ["б"] = "b",
    ["Б"] = "B",
    ["у"] = "u",
    ["У"] = "U",
    ["с"] = "s",
    ["С"] = "S",
    ["х"] = "x",
    ["Х"] = "X",
    ["ч"] = "č",
    ["Ч"] = "Č",
    ["щ"] = "šč",
    ["Щ"] = "Šč",
    ["я"] = "ya",
    ["Я"] = "Ya",
    ["ы"] = "ï",
    ["Ы"] = "Ï",
    ["э"] = "e",
    ["Э"] = "E",
    ["м"] = "m",
    ["М"] = "M",
    ["о"] = "o",
    ["О"] = "O",
    ["и"] = "i",
    ["И"] = "I",
    ["ё"] = "yo",
    ["Ё"] = "Yo",
    ["ж"] = "ž",
    ["Ж"] = "Ž",
    ["к"] = "k",
    ["К"] = "K",
    ["д"] = "d",
    ["Д"] = "D",
    ["в"] = "v",
    ["В"] = "V",
    ["ц"] = "ts",
    ["Ц"] = "Ts",
    ["а"] = "a",
    ["А"] = "A",
    ["ң"] = "ñ",
    ["Ң"] = "Ñ",
    ["ғ"] = "ğ",
    ["Ғ"] = "Ğ",
    ["ҙ"] = "ð",
    ["Ҙ"] = "Đ",
    ["ҡ"] = "q",
    ["Ҡ"] = "Q",
    ["ҫ"] = "θ",
    ["Ҫ"] = "Θ",
    ["һ"] = "h",
    ["Һ"] = "H",
    ["ә"] = "ä",
    ["Ә"] = "Ä"
};

local iotated = {["е"] = "ye", ["Е"] = "Ye"}

function export.tr(text, lang, sc)
    local str_gsub = string.gsub
    local ugsub = mw.ustring.gsub
    -- ү/у should be transliterated as w after vowels
    text = ugsub(text, "([АаЕеЭэЮюЯяӘәИиҮүУуӨөЫы])[үу]", "%1w")

    text = ugsub(text, "([АОӨӘУЫЕЯЁЮИЕаоөәуыэяёюиеъь%A][́̀]?)([Ее])", function(a, e) return a .. iotated[e] end)
    text = ugsub(text, "^[Ее]", iotated)
    text = str_gsub(text, "[\1-\127\194-\244][\128-\191]*", tt)

    return text
end

return export
