-- Category Theory Notes

local in_mathzone = function()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return {

s({trig = "dtl", name = "Direct limit", snippetType = "autosnippet"},
    {
        t("\\varinjlim")
    },
    {condition = in_mathzone}
),

s({trig = "itl", name = "Inverse limit", snippetType = "autosnippet"},
    {
        t("\\varprojlim")
    },
    {condition = in_mathzone}
),

s({trig = "rdu", name = "Right morphism", snippetType = "autosnippet"},
    {
		c(1,
		    {
		        {
                    t("\\redu{"), i(1), t("}{"), i(2), t("}{"), i(3), t("}")
		        },
		        {
                    t("\\redus{"), i(1), t("}{"), i(2), t("}{"), i(3), t("}")
		        },
		        {
                    t("\\redudbl{"), i(1), t("}{"), i(2), t("}{"), i(3), t("}")
		        },
		        {
                    t("\\reduinc{"), i(1), t("}{"), i(2), t("}{"), i(3), t("}")
		        }
		    }
		)
    }
),

s({trig = "ldu", name = "Left morphism arrow", snippetType = "autosnippet"},
    {
        t("\\lmor{"), i(1), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "hom", snippetType = "autosnippet"},
    {
		c(1,
		    {
		        {
                    t("\\h{"), i(1), t("}{"), i(2), t("}")
		        },
		        {
                    t("\\Hom{"), i(1), t("}{"), i(2), t("}{"), i(3), t("}")
		        }
		    }
		)
    },
    {condition = in_mathzone}
),

s({trig = "tk", name = "tikzcd environment"},
    {
		t("\\begin{center}"),
		t({"",""}), t("\\begin{tikzcd}"),
		t({"",""}), t("    "), i(1),
		t({"",""}), t("\\end{tikzcd}"),
		t({"",""}), t("\\end{center}")
    }
),

s({trig = "ar", name = "tikzcd arrow"},
    {
		t("\\arrow["), i(1, "opts"), t("]")
    }
),

s({trig = "op", name = "Dual morphism", snippetType = "autosnippet"},
    {
        c(1,
            {
                {
                    t("\\op{"), i(1), t("}")
                },
                {
                    t("\\ops{"), i(1), t("}")
                },
                {
                    t("\\opu{"), i(1), t("}")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "cat", name = "Category math bold", snippetType = "autosnippet"},
    {
        t("\\Cat{"), i(1), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "dem", name = "Proof"},
    {
        t("\\demo{\\\\"),
        t({"",""}), i(1),
        t({"",""}), t("}"),
    }
),

s({trig = "vib", name = "Swirl", snippetType = "autosnippet"},
    {
        t("\\vibo")
    },
    {condition = in_mathzone}
),

s({trig = "pen", name = "Perpendicular symbol", snippetType = "autosnippet"},
    {
		c(1,
		    {
		        {
                    t("\\perp"), i(1)
		        },
		        {
                    t("\\dashv"), i(1)
		        }
		    }
		)
    },
    {condition = in_mathzone}
),

s({trig = "dow", name = "Down arrow", snippetType = "autosnippet"},
    {
        t("\\downarrow")
    },
    {condition = in_mathzone}
),

s({trig = "ek", name = "Rotated equal symbol", snippetType = "autosnippet"},
    {
        t("\\verteq")
    },
    {condition = in_mathzone}
),

s({trig = "din", name = "Square disjoint unioin", snippetType = "autosnippet"},
    {
        t("\\bigsqcup")
    },
    {condition = in_mathzone}
),

s({trig = "bla", name = "Big logic and", snippetType = "autosnippet"},
    {
        t("\\bigwedge")
    },
    {condition = in_mathzone}
),

s({trig = "blo", name = "Big logic or", snippetType = "autosnippet"},
    {
        t("\\bigvee")
    },
    {condition = in_mathzone}
),

}
