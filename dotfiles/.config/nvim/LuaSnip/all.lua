return{

-- Parentheses

s(
    {trig = "(", descr = "Parentheses", snippetType = "autosnippet", wordTrig = false},
    {
        t("("), i(1), t(")")
    }
),

s(
    {trig = "[", descr = "Square brackets", snippetType = "autosnippet", wordTrig = false},
    {
        t("["), i(1), t("]")
    }
),

s(
    {trig = "{", descr = "Curly brackets", snippetType = "autosnippet", wordTrig = false},
    {
        t("{"), i(1), t("}")
    }
),

-- Quotation marks
--
--s(
    --{trig = "'", descr = "Single quotes", snippetType = "autosnippet", wordTrig = false},
    --{
        --t("'"), i(1), t("'")
    --}
--),

s(
    {trig = "\"", descr = "Double quotes", snippetType = "autosnippet", wordTrig = false},
    {
        t("\""), i(1), t("\"")
    }
),

-- Dots

s(
    {trig = "dt", descr = "bmk dots"},
    {
        t("................")
    }
),
}
