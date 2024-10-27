return{

-- Snippets

s(
	{trig = "snp", name = "Snippet template", snippetType = "autosnippet"},
	{
		c(1, 
			{
				{
					t("s({trig = \""), i(1), t("\", name = \""), i(2), t("\"},"),
					t({"",""}), t("    {"),
					t({"",""}), t("        "), i(3), 
					t({"",""}), t("    }"),
					t({"",""}),
					t("),")
				},
				{
					t("s({trig = \"([^%a])"), i(1), t("\", name = \""), i(2), t("\", snippetType = \"autosnippet\", regTrig = true, wordTrig = false},"),
					t({"",""}), t("    {"),
					t({"",""}), t("        "), i(3),
					t({"",""}), t("    },"),
					t({"",""}), t("    {condition = in_mathzone}"),
					t({"",""}), t("),")
				},
				{
					t("s({trig = \""), i(1), t("\", name = \""), i(2), t("\", snippetType = \"autosnippet\"},"),
					t({"",""}), t("    {"),
					t({"",""}), t("        "), i(3),
					t({"",""}), t("    }"),
					t({"",""}), t("),")
				},
			}
		)
	}
),

s({trig = "chc", name = "Choice node", snippetType = "autosnippet"},
	{
		t("c(1,"),
		t({"",""}), t("    {"),
		t({"",""}), t("        {"),
		t({"",""}), t("            "), i(1,"1st choice"),
		t({"",""}), t("        },"),
		t({"",""}), t("        {"),
		t({"",""}), t("            "), i(2,"2nd choice"),
		t({"",""}), t("        }"), i(3),
		t({"",""}), t("    }"),
		t({"",""}), t(")")
	}
),

s({trig = "rr", name = "Line break in syntax"},
    {
        t("t({\"\",\"\"})")
    }
),

s({trig = "ss", name = "Tab space"},
    {
        t("t(\"    \")")
    }
),

s({trig = "mm", name = "In math zone"},
    {
        t("{condition = in_mathzone}")
    }
),

s({trig = "fn", name = "Insert back"},
    {
        t("f(function(_,snip) return snip.captures[1] end),")
    }
),

s({trig = "vv", name = "Visual node"},
    {
        t("v("), i(1,"pos"), t(",\""), i(2,"visual text"), t("\")")
    }
),

}
