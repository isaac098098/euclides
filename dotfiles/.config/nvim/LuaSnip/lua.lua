return{

-- LuaSnip Snippets

-- Nodes

s(
    {trig = "([^%a])tn", descr = "Text node", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {f( function(_, snip) return snip.captures[1] end ), t("t(\""), i(1), t("\"), ")}
),

s(
    {trig = "([^%a])tb", descr = "Text box node", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {f( function(_, snip) return snip.captures[1] end ), t("t({\""), i(1), t("\""), i(2), t("}), ")}
),

s(
    {trig = "([^%a])in", descr = "Insert node", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {f( function(_, snip) return snip.captures[1] end ), t("i("), i(1), t("), ")}
),

s(
    {trig = "([^%a])rp", descr = "Repeat node", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {f( function(_, snip) return snip.captures[1] end ), t("rep("), i(1), t("), ")}
),
}
