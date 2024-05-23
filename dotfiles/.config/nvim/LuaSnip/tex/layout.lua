local in_mathzone = function()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return{

-- Line breaks

s(
	{trig = "([^%a])pp", dscr = "Big skip", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{t({"","\\bigskip","",""}),i(1), 
	}
),

s(
	{trig = "([^%a])pm", dscr = "Medium skip", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{t({"","\\medskip","",""}), i(1)}
),

-- Labels and references

-- Labels

s(
	{trig = "([^%a])lbe", dscr = "Label equation", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\label{eqn:"), i(1), t("}")}
),

s(
	{trig = "([^%a])lbt", dscr = "Label theorem", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\label{thm:"), i(1), t("}")}
),

s(
	{trig = "([^%a])lbp", dscr = "Label proposition", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\label{prop:"), i(1), t("}")}
),

s(
	{trig = "([^%a])lbc", dscr = "Label corollary", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\label{cor:"), i(1), t("}")}
),

s(
	{trig = "([^%a])lbl", dscr = "Label lemma", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\label{lemma:"), i(1), t("}")}
),

s(
	{trig = "([^%a])lbd", dscr = "Label definition", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\label{def:"), i(1), t("}")}
),

s(
	{trig = "([^%a])lbr", dscr = "Label remark", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\label{rmk:"), i(1), t("}")}
),

s(
	{trig = "([^%a])lbx", dscr = "Label exercise", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\label{ex:"), i(1), t("}")}
),

s(
	{trig = "([^%a])lbm", dscr = "Label example", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\label{em:"), i(1), t("}")}
),

s(
	{trig = "([^%a])lbi", dscr = "Label item", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\label{itm:"), i(1), t("}")}
),

s(
	{trig = "([^%a])nmt", dscr = "Number this", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\numberthis")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])enref", dscr = "Declare ennumerate reference format", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t(",ref=\\the"), i(1), t(".\\textnormal{\\arabic*}")
    }
),

-- References

s(
	{trig = "ct", dscr = "Bibliography citation"},
	{t("\\cite{"), i(1), t("}")}
),

s(
	{trig = "([^%a])rfe", dscr = "Reference equation", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\eqref{eqn:"), i(1), t("}")}
),

s(
	{trig = "([^%a])rft", dscr = "Reference theorem", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\eqref{thm:"), i(1), t("}")}
),

s(
	{trig = "([^%a])rfp", dscr = "Reference proposition", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\eqref{prop:"), i(1), t("}")}
),

s(
	{trig = "([^%a])rfc", dscr = "Reference corollary", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\eqref{cor:"), i(1), t("}")}
),

s(
	{trig = "([^%a])rfl", dscr = "Reference lemma", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\eqref{lemma:"), i(1), t("}")}
),

s(
	{trig = "([^%a])rfd", dscr = "Reference definition", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\eqref{def:"), i(1), t("}")}
),

s(
	{trig = "([^%a])rfr", dscr = "Reference remark", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\eqref{rmk:"), i(1), t("}")}
),

s(
	{trig = "([^%a])rfx", dscr = "Reference exercise", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\eqref{ex:"), i(1), t("}")}
),

s(
	{trig = "([^%a])rfm", dscr = "Reference example", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\eqref{em:"), i(1), t("}")}
),

s(
	{trig = "([^%a])rfi", dscr = "Reference item", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\eqref{it:"), i(1), t("}")}
),

s(
	{trig = "([^%a])rft", dscr = "Reference table", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\eqref{tab:"), i(1), t("}")}
),

-- Spaces

s(
	{trig = "([^%a])hs", dscr = "Horizontal space", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\hspace{"), i(1), t("}")}
),

s(
	{trig = "([^%a])vs", dscr = "Vertical space", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\vspace{"), i(1), t("}")}
),

-- Math mode

s(
	{trig = "([^%a])dis", dscr = "Displaystyle", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\displaystyle")},
    {condition = in_mathzone}
),

-- Sections

s(
	{trig = "([^%a])scn", dscr = "Numbered section", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
		t({"","","\\section{"}), 
		i(1), 
		t({"}","",""}),
		i(2)
	}
),

s(
	{trig = "([^%a])scm", dscr = "Unnumbered section", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
		t({"","","\\section*{"}), i(1), t({"}","",""}),
		i(2)
	}
),

s(
	{trig = "([^%a])Scm", dscr = "Unnumbered section in TOC", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
		t({"","","\\phantomsection",""}),
		t("\\section*{"), i(1), t({"}",""}),
		t("\\markboth{"), rep(1), t("}{"), rep(1), t({"}",""}),
		t("\\addcontentsline{toc}{section}{"), rep(1), t({"}","",""}),
		i(2)
	}
),

s(
	{trig = "([^%a])sbn", dscr = "Numbered subsection", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
		t({"","","\\section{"}), 
		i(1), 
		t({"}","",""}),
		i(2)
	}
),

s(
	{trig = "([^%a])sbm", dscr = "Unnumbered subsection", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
		t({"","","\\section*{"}), 
		i(1), 
		t({"}","",""}),
		i(2)
	}
),

s(
	{trig = "txpdf", dscr = "Define section metadata name"},
    {
        t("\\texorpdfstring{"), i(1), t("}{"), i(2), t("}")
    }
),
}
