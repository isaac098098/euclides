local in_mathzone = function()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return{

-- Strokes

s(
	{trig = "([^%a])un", dscr = "Underline", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\underline{"), i(1), t("}")}
),

s(
	{trig = "([^%a])ca", dscr = "Cancel stroke", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\cancel{"), i(1), t("}")}
),

-- Greek alphabet

s(
	{trig = "([^%a])%.a", dscr = "Lowercase alpha", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\alpha")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.b", dscr = "Lowercase beta", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\beta")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.g", dscr = "Lowercase gamma", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\gamma")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.G", dscr = "Uppercase gamma", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\Gamma")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.d", dscr = "Lowercase delta", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\delta")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.D", dscr = "Uppercase delta", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\Delta")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.e", dscr = "Lowercase epsilon", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\varepsilon")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.z", dscr = "Lowercase zeta", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\zeta")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.z", dscr = "Lowercase eta", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\eta")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.th", dscr = "Lowercase theta", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\theta")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.Th", dscr = "Uppercase theta", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\Theta")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.i", dscr = "Lowercase iota", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\iota")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.k", dscr = "Lowercase kappa", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\kappa")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.l", dscr = "Lowercase lambda", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\lambda")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.L", dscr = "Uppercase lambda", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\Lambda")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.m", dscr = "Lowercase mu", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\mu")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.n", dscr = "Lowercase nu", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\nu")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.x", dscr = "Lowercase xi", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\xi")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.X", dscr = "Uppercase xi", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\Xi")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.pi", dscr = "Lowercase pi", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\pi")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.Pi", dscr = "Uppercase pi", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\Pi")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.r", dscr = "Lowercase rho", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\rho")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.s", dscr = "Lowercase sigma", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\sigma")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.S", dscr = "Uppercase sigma", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\Sigma")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.ta", dscr = "Lowercase tau", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\tau")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.u", dscr = "Lowercase upsilon", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\upsilon")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.U", dscr = "Uppercase upsilon", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\Upsilon")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.ph", dscr = "Lowercase phi", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\varphi")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.Ph", dscr = "Uppercase phi", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\Phi")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.ch", dscr = "Uppercase chi", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\chi")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.ps", dscr = "Lowercase psi", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\psi")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.Ps", dscr = "Uppercase psi", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\Psi")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.o", dscr = "Lowercase omega", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\omega")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.O", dscr = "Uppercase omega", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\Omega")},
    {condition = in_mathzone}
),

-- Blackboard bold

s(
	{trig = "([^%a])%.N", dscr = "Blackboard N", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\N")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.Z", dscr = "Blackboard Z", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\Z")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.Q", dscr = "Blackboard Q", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\Q")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.R", dscr = "Blackboard R", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\R")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.C", dscr = "Blackboard C", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\C")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])%.F", dscr = "Blackboard F", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\F")},
    {condition = in_mathzone}
),

-- Families

s(
	{trig = "([^%a])tt", dscr = "Serif typeface (roman)F", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\textrm{"), i(1), t("}")}
),

s(
	{trig = "([^%a])tn", dscr = "Normal text", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\textnormal{"), i(1), t("}")}
),

s(
	{trig = "([^%a])tm", dscr = "Typewriter typeface (monospace)", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\texttt{"), i(1), t("}")}
),

s(
	{trig = "([^%a])tb", dscr = "Bold text", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\textbf{"), i(1), t("}")}
),

s(
	{trig = "([^%a])ti", dscr = "Italic text", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\textit{"), i(1), t("}")}
),

s(
	{trig = "([^%a])Sc", dscr = "Small caps", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\textsc{"), i(1), t("}")}
),

s(
	{trig = "([^%a])mc", dscr = "Caligraphic font", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\mathcal{"), i(1), t("}")}
),

s(
	{trig = "([^%a])mc", dscr = "Caligraphic font", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\mathcal{"), i(1), t("}")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])mb", dscr = "Blackboard bold font", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\mathbb{"), i(1), t("}")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])mf", dscr = "Fraktur font", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\mathfrak{"), i(1), t("}")},
    {condition = in_mathzone}
),

-- Text color

s(
	{trig = "tcg", dscr = "Textcolor gray"},
	{f( function(_, snip) return snip.captures[1] end ), t("\\textcolor{gray}{"), i(1), t("}")}
),

-- Characters

s(
	{trig = "([^%a])co", dscr = "Colon", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t(":")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])Co", dscr = "Semicolon", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t(";")},
    {condition = in_mathzone}
),
}
