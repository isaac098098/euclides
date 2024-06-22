local in_mathzone = function()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return {

-- Parentheses

s(
    {trig = "([^%a])ap", dscr = "Parentheses", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {f( function(_, snip) return snip.captures[1] end ), t("\\left("), i(1), t("\\right)")},
    {condition = in_mathzone}
),

s(
    {trig = "([^%a])ab", dscr = "Curly brackets", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {f( function(_, snip) return snip.captures[1] end ), t("\\left{"), i(1), t("\\right}")},
    {condition = in_mathzone}
),

s(
    {trig = "([^%a])bb", dscr = "Simple brackets", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {f( function(_, snip) return snip.captures[1] end ), t("\\{"), i(1), t("\\}")},
    {condition = in_mathzone}
),

s(
    {trig = "([^%a])aq", dscr = "Square brackets", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {f( function(_, snip) return snip.captures[1] end ), t("\\left["), i(1), t("\\right]")},
    {condition = in_mathzone}
),

s(
    {trig = "([^%a])as", dscr = "Vertical bars", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {f( function(_, snip) return snip.captures[1] end ), t("\\left|"), i(1), t("\\right|")},
    {condition = in_mathzone}
),

s(
    {trig = "([^%a])|", dscr = "Bars", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {f( function(_, snip) return snip.captures[1] end ), t("|"), i(1), t("|")},
    {condition = in_mathzone}
),

-- Operators

--- Unary
 
s(
	{trig = "([^%a])sq", dscr = "Square root", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ),t("\\sqrt{"), i(1), t("}")},
	{condition = in_mathzone}
),

s(
	{trig = "([^%a])Pm", dscr = "Plus minus", snippetType="autosnippet", regTrig = true, wordTrig = false},
    {f( function(_, snip) return snip.captures[1] end ),t("\\pm ")},
	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])Sq", dscr = "n-th square root", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ),t("\\sqrt["), i(1), t("]{"), i(2), t("}")},
	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])lg", dscr = "Logarithm", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\log")},
	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])sin", dscr = "Sine", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\sin")},
	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])cos", dscr = "Cosine", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\cos")},
	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])tan", dscr = "Tangent", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\tan")},
	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])cot", dscr = "Cotangent", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\cot")},
	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])sec", dscr = "Secant", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\sec")},
	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])csc", dscr = "Cosecant", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\csc")},
	{condition = in_mathzone}
),

s(
	{trig = "([^%a])Sin", dscr = "Arcsine", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\arcsin")},
	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])Cos", dscr = "Arccosine", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\arccos")},
	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])Tan", dscr = "Arctangent", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\arctan")},
	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])Cot", dscr = "Arccotangent", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\textnormal{arc\\hspace{2px}cot}")},
	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])Sec", dscr = "Arcsecant", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\textnormal{arcsec}")},
	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])Csc", dscr = "Arccosecant", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\textnormal{arc\\hspace{2px}csc}")},
	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])cr", dscr = "Overline", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\overline{"), i(1), t("}")},
	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])ver", dscr = "Double bars", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\lVert "), i(1), t(" \\rVert")},
	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])Ver", dscr = "Bigger double bars", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\left\\lVert "), i(1), t(" \\right\\rVert")},
	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])inn", dscr = "Angled bars", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\langle "), i(1), t(" \\rangle")},
	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])Tm", dscr = "Tensor product", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\otimes ")},
	{condition = in_mathzone}
),

--- Binary
 
s(
	{trig = "([^%a])ff", dscr = "Fraction", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ),t("\\frac{"), i(1), t("}{"), i(2), t("}")},
	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])bm", dscr = "Binomial coefficient", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ),t("\\binom{"), i(1), t("}{"), i(2), t("}")},
	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])tm", dscr = "Cross product", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ),t("\\times")},
	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])gr", dscr = "Gradient operator", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ),t("\\nabla")},
	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])div", dscr = "Divergence operator", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ),t("\\nabla\\cdot\\vv{"), i(1), t("}")},
	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])cur", dscr = "Curl operator", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ),t("\\nabla\\times\\vv{"), i(1), t("}")},
	{condition = in_mathzone}
),

-- Superscripts, subscripts and dots

s(
	{trig = ":", dscr = "Superscript", snippetType="autosnippet", wordTrig = false},
	{t("^")},
	{condition = in_mathzone}
),
 
s(
	{trig = ";", dscr = "Subscript", snippetType="autosnippet", wordTrig = false},
	{t("_")},
	{condition = in_mathzone}
),

s(
	{trig = "¨", dscr = "Complete superscript", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ),t("^{"), i(1), t("}")},
	{condition = in_mathzone}
),

s(
	{trig = "´", dscr = "Complete subscript", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ),t("_{"), i(1), t("}")},
	{condition = in_mathzone}
),

s(
	{trig = "lf", dscr = "Left superscript", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\leftindex^"), i(1), t("{"), i(2), t("} ")},
	{condition = in_mathzone}
),

s(
	{trig = "st", dscr = "Double subscript", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ), t("\\substack{"), 
        i(1), t(" \\\\ "), i(2), t("}")
    },
	{condition = in_mathzone}
),

s(
	{trig = "Dt", dscr = "Middle dot", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\cdot")},
	{condition = in_mathzone}
),

s(
	{trig = "cdt", dscr = "Middle dots", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\cdots")},
	{condition = in_mathzone}
),

s(
	{trig = "ldt", dscr = "Lower dots", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\ldots")},
	{condition = in_mathzone}
),

s(
	{trig = "vdt", dscr = "Vertical dots", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\vdots")},
	{condition = in_mathzone}
),

s(
	{trig = "vdt", dscr = "Diagonal dots", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\ddots")},
	{condition = in_mathzone}
),

-- Sums and products
 
s(
	{trig = "([^%a])sm", dscr = "Sum", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ),t("\\sum_{"), i(1), t("}^{"), i(2), t("} ")},
	{condition = in_mathzone}
),

s(
	{trig = "([^%a])Sm", dscr = "Lower index sum", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ),t("\\sum_{"), i(1), t("} ")},
	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])sf", dscr = "Upper infinite sum", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ),t("\\sum_{"), i(1), t("}^{\\infty} ")},
	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])pd", dscr = "Product", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ),t("\\prod_{"), i(1), t("}^{"), i(2), t("} ")},
	{condition = in_mathzone}
),

s(
	{trig = "([^%a])Pd", dscr = "Lower index product", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ),t("\\prod_{"), i(1), t("} ")},
	{condition = in_mathzone}
),

-- Differentials and derivatives

s(
	{trig = "([^%a])dx", dscr = "Inline ifferential", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ),t("\\Dif "), i(1)},
	{condition = in_mathzone}
),

s(
	{trig = "([^%a])derF", dscr = "Derivative in fraction format", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\der{"), i(1), t("}{"), i(2), t("}")
    },
	{condition = in_mathzone}
),

s(
	{trig = "([^%a])DerF", dscr = "n-th derivative in fraction format", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\nder{"), i(1), t("}{"), i(2), t("}{"), i(3), t("}"), 
    },
	{condition = in_mathzone}
),

s(
	{trig = "([^%a])parF", dscr = "Partial derivative in fraction format", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\prt{"), i(1), t("}{"), i(2), t("}")
    },
	{condition = in_mathzone}
),

s(
	{trig = "([^%a])ParF", dscr = "n-th partial derivative in fraction format", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\nprt{"), i(1), t("}{"), i(2), t("}{"), i(3), t("}"), 
    },
	{condition = in_mathzone}
),

s(
	{trig = "([^%a])derO", dscr = "Derivative in fraction format", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\derOp{"), i(1), t("}{"), i(2), t("}")
    },
	{condition = in_mathzone}
),

s(
	{trig = "([^%a])DerO", dscr = "n-th derivative in fraction format", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\nderOp{"), i(1), t("}{"), i(2), t("}{"), i(3), t("}"), 
    },
	{condition = in_mathzone}
),

s(
	{trig = "([^%a])parO", dscr = "Partial derivative in fraction format", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\prtOp{"), i(1), t("}{"), i(2), t("}")
    },
	{condition = in_mathzone}
),

s(
	{trig = "([^%a])ParO", dscr = "n-th partial derivative in fraction format", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\nprtOp{"), i(1), t("}{"), i(2), t("}{"), i(3), t("}"), 
    },
	{condition = in_mathzone}
),

-- Integrals
 
s(
	{trig = "([^%a])int", dscr = "Indefinite integral", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ),t("\\int "), i(1)},
	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])inl", dscr = "Lower integral", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ),t("\\int_{"), i(1), t("} ")},	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])ind", dscr = "Definite integral", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ),t("\\int_{"), i(1), t("}^{"), i(2), t("} ")},
	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])inL", dscr = "Lower improper integral", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ),t("\\int_{-\\infty}^{"), i(1), t("} ")},
	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])inU", dscr = "Upper improper integral", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ),t("\\int_{"), i(1), t("}^{\\infty} ")},
	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])inF", dscr = "Totally improper integral", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ),t("\\int_{-\\infty}^{\\infty} ")},
	{condition = in_mathzone}
),

-- Functions

s(
	{trig = "([^%a])fn", dscr = "Function domain and codomain", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
		f( function(_, snip) return snip.captures[1] end ), i(1), t(" : "), i(2), t(" \\longrightarrow "), i(3)
	},
	{condition = in_mathzone}
),

s(
	{trig = "([^%a])mp", dscr = "Explicit function definition", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
		t({"","\\begin{align*}","    "}), 
		i(1), t(" : "), i(2), t(" & \\longrightarrow "), i(3), t({" \\\\","    "}),
		i(4), t(" & \\longmapsto "), i(5),
		t({"","\\end{align*}"}), i(6)
	}
),

s(
	{trig = "([^%a])ef", dscr = "Longmapsto", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t(" "), i(1), t("\\longmapsto ")
	},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])fc", dscr = "Function defined by cases", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
		t({""," \\begin{equation*}","    "}), 
		i(1), t({" = \\begin{cases}","        "}),
        i(2), t(" & \\textnormal{"), i(3), t("} "), i(4), t({" \\\\ \\hfil","        "}),
        i(5), t(" & \\textnormal{"), i(6), t("} "), i(7), t({"","    "}),
        t({"\\end{cases}","\\end{equation*}"})
	}
),

-- Sets

s(
	{trig = "([^%a])setd", dscr = "Conditional set with dots", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\left\\{"), i(1), t(" \\: : \\: "), i(2), t("\\right\\}")
	},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])setD", dscr = "Conditional set with dots inline", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\left\\{"), i(1), t(" : "), i(2), t("\\right\\}")
	},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])setb", dscr = "Conditional set with bar", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\left\\{"), i(1), t(" \\: \\mid \\: "), i(2), t("\\right\\}")
	},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])setB", dscr = "Conditional set with bar inline", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\left\\{"), i(1), t(" \\mid "), i(2), t("\\right\\}")
	},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])bu", dscr = "Union symbol", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\cup ")
	},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])bi", dscr = "Intersection symbol", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\cap ")
	},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])Bu", dscr = "Big union symbol", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\bigcup ")
	},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])Bi", dscr = "Big intersection symbol", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\bigcap ")
	},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])BUs", dscr = "Union with subscript and supercript", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\bigcup_{"), i(1), t("}^{"), i(2), t("} ")
	},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])BIs", dscr = "Intersection with subscript and supercript", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\bigcap_{"), i(1), t("}^{"), i(2), t("} ")
	},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])BUi", dscr = "Union with subscript", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\bigcup_{"), i(1), t("} ")
	},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])BIi", dscr = "Intersection with subscript", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\bigcap_{"), i(1), t("} ")
	},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])sbs", dscr = "Subset", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\subset ")
	},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])sbq", dscr = "Subset equal", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\subseteq ")
	},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])sps", dscr = "Contains", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\supset ")
	},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])spq", dscr = "Contains equal", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\supseteq ")
	},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])ms", dscr = "Set difference", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\setminus ")
	},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])sd", dscr = "Symmetric difference", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\triangle ")
	},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])sup", dscr = "Supremum", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\sup")
	},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])Sup", dscr = "Subindex supremum", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\sup_{"), i(1), t("} ")
	},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])inf", dscr = "Infimum", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\inf")
	},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])Inf", dscr = "Subindex infimum", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\inf_{"), i(1), t("} ")
	},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])mx", dscr = "Maximum", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\max")
	},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])mn", dscr = "Minimum", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\min")
	},
    {condition = in_mathzone}
),

-- Families and sequences

s(
	{trig = "([^%a])ifm", dscr = "Indexed family", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\left\\{"), i(1), t("\\right\\}_{"), i(2), t("}"), 
	},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])sfm", dscr = "Subscript and superscript family", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\left\\{"), i(1), t("\\right\\}_{"), i(2), t("}^{"), i(3), t("}"), 
	},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])seq", dscr = "Sequence in set format", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\left\\{"), i(1), t("_{"), i(2), t("}\\right\\}_{"), rep(2), t("\\to\\infty}"), 
	},
    {condition = in_mathzone}
),

-- Logic and Quantifiers

s(
	{trig = "([^%a])ne", dscr = "Not equal", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\neq ")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])am", dscr = "Align", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("& = ")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])Am", dscr = "Align", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t({" \\\\","& = "}), },
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])Au", dscr = "Nested align", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("&& = ")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])land", dscr = "And symbol", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\land ")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])lor", dscr = "And symbol", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\lor ")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])fa", dscr = "For all", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\:\\forall\\: ")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])ex", dscr = "exist", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\:\\exists\\: ")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])In", dscr = "Belongs to", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\in ")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])na", dscr = "In naturals", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\in\\N")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])im", dscr = "Implies symbol", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\implies ")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])iif", dscr = "If and only if symbol", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\iff")},
    {condition = in_mathzone}
),

-- Limits

s(
	{trig = "([^%a])lf", dscr = "Infinite limit", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\lim_{"), i(1), t("\\to\\infty} ")
	},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])ll", dscr = "Definite limit", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\lim_{"), i(1), t("\\to "), i(2), t("} ")
	},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])arr", dscr = "Arrow limit with text", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\xrightarrow["), i(1), t("]{"), i(2), t("} ")
	},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])to", dscr = "Arrow limit", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\rightarrow ")
	},
    {condition = in_mathzone}
),

-- Symbols
 
s(
	{trig = "([^%a])wd", dscr = "Triangle without base", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\bigwedge ")},
	{condition = in_mathzone}
),
 
s(
	{trig = "([^%a])cir", dscr = "Circle", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\circ")},
	{condition = in_mathzone}
),

s(
	{trig = "([^%a])Pm", dscr = "Plus minus symbol", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\pm ")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])fy", dscr = "Infinity symbol", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\infty")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])ltr", dscr = "Left pointing triangle", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\lhd")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])nb", dscr = "Inverted triangle", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\nabla")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])vac", dscr = "Empty set", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\vcc")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])dvv", dscr = "Mid bar", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\mid ")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])pt", dscr = "Partial/boundary symbol", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\partial ")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])tp", dscr = "Big tau symbol (macro)", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\tp")},
    {condition = in_mathzone}
),

-- Relations

s(
	{trig = "([^%a])lq", dscr = "Less or equal than", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\leq ")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])gq", dscr = "Greater or equal than", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\geq ")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])ev", dscr = "Equivalent bars", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\equiv ")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])Ev", dscr = "Not equivalent bars", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\not\\equiv ")},
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])mod", dscr = "Equivalent mod n", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ), 
        t("\\equiv "), i(1), t(" \\:\\:\\textnormal{mod }")
    },
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])Mod", dscr = "Not equivalent mod n", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ), 
        t("\\not\\equiv "), i(1), t(" \\:\\:\\textnormal{mod }")
    },
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])qq", dscr = "Middle tilde symbol", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ), 
        t("\\sim ")
    },
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])qq", dscr = "Middle tilde symbol negation", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ), 
        t("\\nsim ")
    },
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])iso", dscr = "Bars and tilde symbol", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ), 
        t("\\cong ")
    },
    {condition = in_mathzone}
),

s(
	{trig = "([^%a])Iso", dscr = "Bars and tilde symbol negation", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ), 
        t("\\ncong ")
    },
    {condition = in_mathzone}
),

-- Vectors
 
s(
	{trig = "([^%a])vec", dscr = "Arrow vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\vv{"), i(1), t("}")},
    {condition = in_mathzone}
),
 
s(
	{trig = "([^%a])hat", dscr = "Unitary vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ), t("\\hat{"), i(1), t("}")},
    {condition = in_mathzone}
),

-- Arrays

-- Generic
 
s(
{trig = "([^%a])mtgT", dscr = "Generic indexed table matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{matrix}",""}),
        t(" "), i(1), t("_{11} & "), rep(1), t("_{12} & \\cdots & "), rep(1), t("_{1"), i(3), t({"} \\\\",""}),
        t(" "), rep(1), t("_{21} & "), rep(1), t("_{22} & \\cdots & "), rep(1), t("_{2"), rep(3), t({"} \\\\",""}),
        t(" "), t({"\\vdots & \\vdots & \\ddots & \\vdots \\\\",""}), 
        t(" "), rep(1), t("_{"), i(2), t("1} & "), rep(1), t("_{"), rep(2), t("2} & \\cdots & "), rep(1), t("_{"), rep(2), rep(3), t({"}",""}),
        t("\\end{matrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mtfT", dscr = "Generic free table matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{matrix}",""}),
        t(" "), i(1), t(" & "), i(2), t(" & \\cdots & "), i(3), t({" \\\\",""}),
        t(" "), i(4), t(" & "), i(5), t(" & \\cdots & "), i(6), t({" \\\\",""}),
        t(" "), t({"\\vdots & \\vdots & \\ddots & \\vdots \\\\",""}), 
        t(" "), i(7), t(" & "), i(8), t(" & \\cdots & "), i(9), t({" \\\\",""}),
        t("\\end{matrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mtgP", dscr = "Generic indexed parentheses matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{pmatrix}",""}),
        t(" "), i(1), t("_{11} & "), rep(1), t("_{12} & \\cdots & "), rep(1), t("_{1"), i(3), t({"} \\\\",""}),
        t(" "), rep(1), t("_{21} & "), rep(1), t("_{22} & \\cdots & "), rep(1), t("_{2"), rep(3), t({"} \\\\",""}),
        t(" "), t({"\\vdots & \\vdots & \\ddots & \\vdots \\\\",""}), 
        t(" "), rep(1), t("_{"), i(2), t("1} & "), rep(1), t("_{"), rep(2), t("2} & \\cdots & "), rep(1), t("_{"), rep(2), rep(3), t({"}",""}),
        t("\\end{pmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mtfP", dscr = "Generic free parentheses matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{pmatrix}",""}),
        t(" "), i(1), t(" & "), i(2), t(" & \\cdots & "), i(3), t({" \\\\",""}),
        t(" "), i(4), t(" & "), i(5), t(" & \\cdots & "), i(6), t({" \\\\",""}),
        t(" "), t({"\\vdots & \\vdots & \\ddots & \\vdots \\\\",""}), 
        t(" "), i(7), t(" & "), i(8), t(" & \\cdots & "), i(9), t({" \\\\",""}),
        t("\\end{pmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mtgB", dscr = "Generic indexed bracket matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{bmatrix}",""}),
        t(" "), i(1), t("_{11} & "), rep(1), t("_{12} & \\cdots & "), rep(1), t("_{1"), i(3), t({"} \\\\",""}),
        t(" "), rep(1), t("_{21} & "), rep(1), t("_{22} & \\cdots & "), rep(1), t("_{2"), rep(3), t({"} \\\\",""}),
        t(" "), t({"\\vdots & \\vdots & \\ddots & \\vdots \\\\",""}), 
        t(" "), rep(1), t("_{"), i(2), t("1} & "), rep(1), t("_{"), rep(2), t("2} & \\cdots & "), rep(1), t("_{"), rep(2), rep(3), t({"}",""}),
        t("\\end{bmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mtfB", dscr = "Generic free bracket matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{bmatrix}",""}),
        t(" "), i(1), t(" & "), i(2), t(" & \\cdots & "), i(3), t({" \\\\",""}),
        t(" "), i(4), t(" & "), i(5), t(" & \\cdots & "), i(6), t({" \\\\",""}),
        t(" "), t({"\\vdots & \\vdots & \\ddots & \\vdots \\\\",""}), 
        t(" "), i(7), t(" & "), i(8), t(" & \\cdots & "), i(9), t({" \\\\",""}),
        t("\\end{bmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mtgD", dscr = "Generic indexed determinant matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{vmatrix}",""}),
        t(" "), i(1), t("_{11} & "), rep(1), t("_{12} & \\cdots & "), rep(1), t("_{1"), i(3), t({"} \\\\",""}),
        t(" "), rep(1), t("_{21} & "), rep(1), t("_{22} & \\cdots & "), rep(1), t("_{2"), rep(3), t({"} \\\\",""}),
        t(" "), t({"\\vdots & \\vdots & \\ddots & \\vdots \\\\",""}), 
        t(" "), rep(1), t("_{"), i(2), t("1} & "), rep(1), t("_{"), rep(2), t("2} & \\cdots & "), rep(1), t("_{"), rep(2), rep(3), t({"}",""}),
        t("\\end{vmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mtfD", dscr = "Generic free determinant matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{vmatrix}",""}),
        t(" "), i(1), t(" & "), i(2), t(" & \\cdots & "), i(3), t({" \\\\",""}),
        t(" "), i(4), t(" & "), i(5), t(" & \\cdots & "), i(6), t({" \\\\",""}),
        t(" "), t({"\\vdots & \\vdots & \\ddots & \\vdots \\\\",""}), 
        t(" "), i(7), t(" & "), i(8), t(" & \\cdots & "), i(9), t({" \\\\",""}),
        t("\\end{vmatrix}")
    },
    {condition = in_mathzone}
),

-- 2x2
 
s(
{trig = "([^%a])mt2iT", dscr = "2x2 indexed table matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{matrix}",""}),
        t(" "), i(1), t("_{11} & "), rep(1), t({"_{12} \\\\",""}),
        t(" "), rep(1), t("_{21} & "), rep(1), t({"_{22} \\\\",""}),
        t("\\end{matrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mt2fT", dscr = "2x2 free table matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{matrix}",""}),
        t(" "), i(1), t(" & "), i(2), t({" \\\\",""}),
        t(" "), i(3), t(" & "), i(4), t({" \\\\",""}),
        t("\\end{matrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mt2iP", dscr = "2x2 indexed parentheses matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{pmatrix}",""}),
        t(" "), i(1), t("_{11} & "), rep(1), t({"_{12} \\\\",""}),
        t(" "), rep(1), t("_{21} & "), rep(1), t({"_{22} \\\\",""}),
        t("\\end{pmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mt2fP", dscr = "2x2 free table matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{pmatrix}",""}),
        t(" "), i(1), t(" & "), i(2), t({" \\\\",""}),
        t(" "), i(3), t(" & "), i(4), t({" \\\\",""}),
        t("\\end{pmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mt2iB", dscr = "2x2 indexed bracket matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{bmatrix}",""}),
        t(" "), i(1), t("_{11} & "), rep(1), t({"_{12} \\\\",""}),
        t(" "), rep(1), t("_{21} & "), rep(1), t({"_{22} \\\\",""}),
        t("\\end{bmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mt2fB", dscr = "2x2 free bracket matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{bmatrix}",""}),
        t(" "), i(1), t(" & "), i(2), t({" \\\\",""}),
        t(" "), i(3), t(" & "), i(4), t({" \\\\",""}),
        t("\\end{bmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mt2iD", dscr = "2x2 indexed determinant matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{vmatrix}",""}),
        t(" "), i(1), t("_{11} & "), rep(1), t({"_{12} \\\\",""}),
        t(" "), rep(1), t("_{21} & "), rep(1), t({"_{22} \\\\",""}),
        t("\\end{vmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mt2fD", dscr = "2x2 free determinant matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{vpmatrix}",""}),
        t(" "), i(1), t(" & "), i(2), t({" \\\\",""}),
        t(" "), i(3), t(" & "), i(4), t({" \\\\",""}),
        t("\\end{vpmatrix}")
    },
    {condition = in_mathzone}
),

-- 3x3
 
s(
{trig = "([^%a])mt3iT", dscr = "3x3 indexed table matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{matrix}",""}),
        t(" "), i(1), t("_{11} & "), rep(1), t("_{12} & "), rep(1), t({"_{13} \\\\",""}),
        t(" "), rep(1), t("_{21} & "), rep(1), t("_{22} & "), rep(1), t({"_{23} \\\\",""}),
        t(" "), rep(1), t("_{31} & "), rep(1), t("_{32} & "), rep(1), t({"_{33} \\\\",""}),
        t("\\end{matrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mt3fT", dscr = "3x3 free table matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{matrix}",""}),
        t(" "), i(1), t(" & "), i(2), t(" & "), i(3), t({" \\\\",""}),
        t(" "), i(4), t(" & "), i(5), t(" & "), i(6), t({" \\\\",""}),
        t(" "), i(7), t(" & "), i(8), t(" & "), i(9), t({" \\\\",""}),
        t("\\end{matrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mt3iP", dscr = "3x3 indexed parentheses matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{pmatrix}",""}),
        t(" "), i(1), t("_{11} & "), rep(1), t("_{12} & "), rep(1), t({"_{13} \\\\",""}),
        t(" "), rep(1), t("_{21} & "), rep(1), t("_{22} & "), rep(1), t({"_{23} \\\\",""}),
        t(" "), rep(1), t("_{31} & "), rep(1), t("_{32} & "), rep(1), t({"_{33} \\\\",""}),
        t("\\end{pmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mt3fP", dscr = "3x3 free parentheses matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{pmatrix}",""}),
        t(" "), i(1), t(" & "), i(2), t(" & "), i(3), t({" \\\\",""}),
        t(" "), i(4), t(" & "), i(5), t(" & "), i(6), t({" \\\\",""}),
        t(" "), i(7), t(" & "), i(8), t(" & "), i(9), t({" \\\\",""}),
        t("\\end{pmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mt3iB", dscr = "3x3 indexed bracket matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{bmatrix}",""}),
        t(" "), i(1), t("_{11} & "), rep(1), t("_{12} & "), rep(1), t({"_{13} \\\\",""}),
        t(" "), rep(1), t("_{21} & "), rep(1), t("_{22} & "), rep(1), t({"_{23} \\\\",""}),
        t(" "), rep(1), t("_{31} & "), rep(1), t("_{32} & "), rep(1), t({"_{33} \\\\",""}),
        t("\\end{bmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mt3fB", dscr = "3x3 free bracket matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{bmatrix}",""}),
        t(" "), i(1), t(" & "), i(2), t(" & "), i(3), t({" \\\\",""}),
        t(" "), i(4), t(" & "), i(5), t(" & "), i(6), t({" \\\\",""}),
        t(" "), i(7), t(" & "), i(8), t(" & "), i(9), t({" \\\\",""}),
        t("\\end{bmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mt3iD", dscr = "3x3 indexed determinant matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{vmatrix}",""}),
        t(" "), i(1), t("_{11} & "), rep(1), t("_{12} & "), rep(1), t({"_{13} \\\\",""}),
        t(" "), rep(1), t("_{21} & "), rep(1), t("_{22} & "), rep(1), t({"_{23} \\\\",""}),
        t(" "), rep(1), t("_{31} & "), rep(1), t("_{32} & "), rep(1), t({"_{33} \\\\",""}),
        t("\\end{vmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mt3fD", dscr = "3x3 free determinant matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{vmatrix}",""}),
        t(" "), i(1), t(" & "), i(2), t(" & "), i(3), t({" \\\\",""}),
        t(" "), i(4), t(" & "), i(5), t(" & "), i(6), t({" \\\\",""}),
        t(" "), i(7), t(" & "), i(8), t(" & "), i(9), t({" \\\\",""}),
        t("\\end{vmatrix}")
    },
    {condition = in_mathzone}
),

-- 4x4
 
s(
{trig = "([^%a])mt4iT", dscr = "4x4 indexed table matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{matrix}",""}),
        t(" "), i(1), t("_{11} & "), rep(1), t("_{12} & "), rep(1), t("_{13} & "), rep(1), t({"_{14} \\\\",""}),
        t(" "), rep(1), t("_{21} & "), rep(1), t("_{22} & "), rep(1), t("_{23} & "), rep(1), t({"_{24} \\\\",""}),
        t(" "), rep(1), t("_{31} & "), rep(1), t("_{32} & "), rep(1), t("_{33} & "), rep(1), t({"_{34} \\\\",""}),
        t(" "), rep(1), t("_{41} & "), rep(1), t("_{42} & "), rep(1), t("_{43} & "), rep(1), t({"_{44} \\\\",""}),
        t("\\end{matrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mt4fT", dscr = "4x4 free table matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{matrix}",""}),
        t(" "), i(1), t(" & "), i(2), t(" & "), i(3), t(" & "), i(4), t({" \\\\",""}),
        t(" "), i(5), t(" & "), i(6), t(" & "), i(7), t(" & "), i(8), t({" \\\\",""}),
        t(" "), i(9), t(" & "), i(10), t(" & "), i(11), t(" & "), i(12), t({" \\\\",""}),
        t(" "), i(13), t(" & "), i(14), t(" & "), i(15), t(" & "), i(16), t({" \\\\",""}),
        t("\\end{matrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mt4iP", dscr = "4x4 indexed parentheses matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{pmatrix}",""}),
        t(" "), i(1), t("_{11} & "), rep(1), t("_{12} & "), rep(1), t("_{13} & "), rep(1), t({"_{14} \\\\",""}),
        t(" "), rep(1), t("_{21} & "), rep(1), t("_{22} & "), rep(1), t("_{23} & "), rep(1), t({"_{24} \\\\",""}),
        t(" "), rep(1), t("_{31} & "), rep(1), t("_{32} & "), rep(1), t("_{33} & "), rep(1), t({"_{34} \\\\",""}),
        t(" "), rep(1), t("_{41} & "), rep(1), t("_{42} & "), rep(1), t("_{43} & "), rep(1), t({"_{44} \\\\",""}),
        t("\\end{pmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mt4fP", dscr = "4x4 free parentheses matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{pmatrix}",""}),
        t(" "), i(1), t(" & "), i(2), t(" & "), i(3), t(" & "), i(4), t({" \\\\",""}),
        t(" "), i(5), t(" & "), i(6), t(" & "), i(7), t(" & "), i(8), t({" \\\\",""}),
        t(" "), i(9), t(" & "), i(10), t(" & "), i(11), t(" & "), i(12), t({" \\\\",""}),
        t(" "), i(13), t(" & "), i(14), t(" & "), i(15), t(" & "), i(16), t({" \\\\",""}),
        t("\\end{pmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mt4iB", dscr = "4x4 indexed bracket matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{bmatrix}",""}),
        t(" "), i(1), t("_{11} & "), rep(1), t("_{12} & "), rep(1), t("_{13} & "), rep(1), t({"_{14} \\\\",""}),
        t(" "), rep(1), t("_{21} & "), rep(1), t("_{22} & "), rep(1), t("_{23} & "), rep(1), t({"_{24} \\\\",""}),
        t(" "), rep(1), t("_{31} & "), rep(1), t("_{32} & "), rep(1), t("_{33} & "), rep(1), t({"_{34} \\\\",""}),
        t(" "), rep(1), t("_{41} & "), rep(1), t("_{42} & "), rep(1), t("_{43} & "), rep(1), t({"_{44} \\\\",""}),
        t("\\end{bmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mt4fB", dscr = "4x4 free bracket matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{bmatrix}",""}),
        t(" "), i(1), t(" & "), i(2), t(" & "), i(3), t(" & "), i(4), t({" \\\\",""}),
        t(" "), i(5), t(" & "), i(6), t(" & "), i(7), t(" & "), i(8), t({" \\\\",""}),
        t(" "), i(9), t(" & "), i(10), t(" & "), i(11), t(" & "), i(12), t({" \\\\",""}),
        t(" "), i(13), t(" & "), i(14), t(" & "), i(15), t(" & "), i(16), t({" \\\\",""}),
        t("\\end{bmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mt4iD", dscr = "4x4 indexed determinant matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{vmatrix}",""}),
        t(" "), i(1), t("_{11} & "), rep(1), t("_{12} & "), rep(1), t("_{13} & "), rep(1), t({"_{14} \\\\",""}),
        t(" "), rep(1), t("_{21} & "), rep(1), t("_{22} & "), rep(1), t("_{23} & "), rep(1), t({"_{24} \\\\",""}),
        t(" "), rep(1), t("_{31} & "), rep(1), t("_{32} & "), rep(1), t("_{33} & "), rep(1), t({"_{34} \\\\",""}),
        t(" "), rep(1), t("_{41} & "), rep(1), t("_{42} & "), rep(1), t("_{43} & "), rep(1), t({"_{44} \\\\",""}),
        t("\\end{vmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mt4fB", dscr = "4x4 free determinant matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{vmatrix}",""}),
        t(" "), i(1), t(" & "), i(2), t(" & "), i(3), t(" & "), i(4), t({" \\\\",""}),
        t(" "), i(5), t(" & "), i(6), t(" & "), i(7), t(" & "), i(8), t({" \\\\",""}),
        t(" "), i(9), t(" & "), i(10), t(" & "), i(11), t(" & "), i(12), t({" \\\\",""}),
        t(" "), i(13), t(" & "), i(14), t(" & "), i(15), t(" & "), i(16), t({" \\\\",""}),
        t("\\end{vmatrix}")
    },
    {condition = in_mathzone}
),

-- 5x5
 
s(
{trig = "([^%a])mt5iT", dscr = "5x5 indexed table matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{matrix}",""}),
        t(" "), i(1), t("_{11} & "), rep(1), t("_{12} & "), rep(1), t("_{13} & "), rep(1), t("_{14} & "), rep(1), t({"_{15} \\\\",""}),
        t(" "), rep(1), t("_{21} & "), rep(1), t("_{22} & "), rep(1), t("_{23} & "), rep(1), t("_{24} & "), rep(1), t({"_{25} \\\\",""}),
        t(" "), rep(1), t("_{31} & "), rep(1), t("_{32} & "), rep(1), t("_{33} & "), rep(1), t("_{34} & "), rep(1), t({"_{35} \\\\",""}),
        t(" "), rep(1), t("_{41} & "), rep(1), t("_{42} & "), rep(1), t("_{43} & "), rep(1), t("_{44} & "), rep(1), t({"_{45} \\\\",""}),
        t(" "), rep(1), t("_{51} & "), rep(1), t("_{52} & "), rep(1), t("_{53} & "), rep(1), t("_{54} & "), rep(1), t({"_{55} \\\\",""}),
        t("\\end{matrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mt5fT", dscr = "5x5 free table matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{matrix}",""}),
        t(" "), i(1), t(" & "), i(2), t(" & "), i(3), t(" & "), i(4), t(" & "), i(5), t({" \\\\",""}),
        t(" "), i(6), t(" & "), i(7), t(" & "), i(8), t(" & "), i(9), t(" & "), i(10), t({" \\\\",""}),
        t(" "), i(11), t(" & "), i(12), t(" & "), i(13), t(" & "), i(14), t(" & "), i(15), t({" \\\\",""}),
        t(" "), i(16), t(" & "), i(17), t(" & "), i(18), t(" & "), i(19), t(" & "), i(20), t({" \\\\",""}),
        t(" "), i(21), t(" & "), i(22), t(" & "), i(23), t(" & "), i(24), t(" & "), i(25), t({" \\\\",""}),
        t("\\end{matrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mt5iP", dscr = "5x5 indexed parentheses matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{pmatrix}",""}),
        t(" "), i(1), t("_{11} & "), rep(1), t("_{12} & "), rep(1), t("_{13} & "), rep(1), t("_{14} & "), rep(1), t({"_{15} \\\\",""}),
        t(" "), rep(1), t("_{21} & "), rep(1), t("_{22} & "), rep(1), t("_{23} & "), rep(1), t("_{24} & "), rep(1), t({"_{25} \\\\",""}),
        t(" "), rep(1), t("_{31} & "), rep(1), t("_{32} & "), rep(1), t("_{33} & "), rep(1), t("_{34} & "), rep(1), t({"_{35} \\\\",""}),
        t(" "), rep(1), t("_{41} & "), rep(1), t("_{42} & "), rep(1), t("_{43} & "), rep(1), t("_{44} & "), rep(1), t({"_{45} \\\\",""}),
        t(" "), rep(1), t("_{51} & "), rep(1), t("_{52} & "), rep(1), t("_{53} & "), rep(1), t("_{54} & "), rep(1), t({"_{55} \\\\",""}),
        t("\\end{pmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mt5fP", dscr = "5x5 free parentheses matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{pmatrix}",""}),
        t(" "), i(1), t(" & "), i(2), t(" & "), i(3), t(" & "), i(4), t(" & "), i(5), t({" \\\\",""}),
        t(" "), i(6), t(" & "), i(7), t(" & "), i(8), t(" & "), i(9), t(" & "), i(10), t({" \\\\",""}),
        t(" "), i(11), t(" & "), i(12), t(" & "), i(13), t(" & "), i(14), t(" & "), i(15), t({" \\\\",""}),
        t(" "), i(16), t(" & "), i(17), t(" & "), i(18), t(" & "), i(19), t(" & "), i(20), t({" \\\\",""}),
        t(" "), i(21), t(" & "), i(22), t(" & "), i(23), t(" & "), i(24), t(" & "), i(25), t({" \\\\",""}),
        t("\\end{pmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mt5iB", dscr = "5x5 indexed bracket matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{bmatrix}",""}),
        t(" "), i(1), t("_{11} & "), rep(1), t("_{12} & "), rep(1), t("_{13} & "), rep(1), t("_{14} & "), rep(1), t({"_{15} \\\\",""}),
        t(" "), rep(1), t("_{21} & "), rep(1), t("_{22} & "), rep(1), t("_{23} & "), rep(1), t("_{24} & "), rep(1), t({"_{25} \\\\",""}),
        t(" "), rep(1), t("_{31} & "), rep(1), t("_{32} & "), rep(1), t("_{33} & "), rep(1), t("_{34} & "), rep(1), t({"_{35} \\\\",""}),
        t(" "), rep(1), t("_{41} & "), rep(1), t("_{42} & "), rep(1), t("_{43} & "), rep(1), t("_{44} & "), rep(1), t({"_{45} \\\\",""}),
        t(" "), rep(1), t("_{51} & "), rep(1), t("_{52} & "), rep(1), t("_{53} & "), rep(1), t("_{54} & "), rep(1), t({"_{55} \\\\",""}),
        t("\\end{bmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mt5fB", dscr = "5x5 free parentheses matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{bmatrix}",""}),
        t(" "), i(1), t(" & "), i(2), t(" & "), i(3), t(" & "), i(4), t(" & "), i(5), t({" \\\\",""}),
        t(" "), i(6), t(" & "), i(7), t(" & "), i(8), t(" & "), i(9), t(" & "), i(10), t({" \\\\",""}),
        t(" "), i(11), t(" & "), i(12), t(" & "), i(13), t(" & "), i(14), t(" & "), i(15), t({" \\\\",""}),
        t(" "), i(16), t(" & "), i(17), t(" & "), i(18), t(" & "), i(19), t(" & "), i(20), t({" \\\\",""}),
        t(" "), i(21), t(" & "), i(22), t(" & "), i(23), t(" & "), i(24), t(" & "), i(25), t({" \\\\",""}),
        t("\\end{bmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mt5iD", dscr = "5x5 indexed determinant matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{vmatrix}",""}),
        t(" "), i(1), t("_{11} & "), rep(1), t("_{12} & "), rep(1), t("_{13} & "), rep(1), t("_{14} & "), rep(1), t({"_{15} \\\\",""}),
        t(" "), rep(1), t("_{21} & "), rep(1), t("_{22} & "), rep(1), t("_{23} & "), rep(1), t("_{24} & "), rep(1), t({"_{25} \\\\",""}),
        t(" "), rep(1), t("_{31} & "), rep(1), t("_{32} & "), rep(1), t("_{33} & "), rep(1), t("_{34} & "), rep(1), t({"_{35} \\\\",""}),
        t(" "), rep(1), t("_{41} & "), rep(1), t("_{42} & "), rep(1), t("_{43} & "), rep(1), t("_{44} & "), rep(1), t({"_{45} \\\\",""}),
        t(" "), rep(1), t("_{51} & "), rep(1), t("_{52} & "), rep(1), t("_{53} & "), rep(1), t("_{54} & "), rep(1), t({"_{55} \\\\",""}),
        t("\\end{vmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])mt5fD", dscr = "5x5 free determinant matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{vmatrix}",""}),
        t(" "), i(1), t(" & "), i(2), t(" & "), i(3), t(" & "), i(4), t(" & "), i(5), t({" \\\\",""}),
        t(" "), i(6), t(" & "), i(7), t(" & "), i(8), t(" & "), i(9), t(" & "), i(10), t({" \\\\",""}),
        t(" "), i(11), t(" & "), i(12), t(" & "), i(13), t(" & "), i(14), t(" & "), i(15), t({" \\\\",""}),
        t(" "), i(16), t(" & "), i(17), t(" & "), i(18), t(" & "), i(19), t(" & "), i(20), t({" \\\\",""}),
        t(" "), i(21), t(" & "), i(22), t(" & "), i(23), t(" & "), i(24), t(" & "), i(25), t({" \\\\",""}),
        t("\\end{vmatrix}")
    },
    {condition = in_mathzone}
),

-- Generic column vectors
 
s(
{trig = "([^%a])vtgT", dscr = "Generic indexed table column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{matrix}",""}),
        t(" "), i(1), t({"_{1} \\\\",""}),
        t(" "), rep(1), t({"_{2} \\\\",""}),
        t({" \\vdots \\\\",""}), 
        t(" "), rep(1), t("_{"), i(2), t({"} \\\\",""}),
        t("\\end{matrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vtfT", dscr = "Generic free table column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{matrix}",""}),
        t(" "), i(1), t({" \\\\",""}),
        t(" "), i(2), t({" \\\\",""}),
        t({" \\vdots \\\\",""}), 
        t(" "), i(3), t({" \\\\",""}),
        t("\\end{matrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vtgP", dscr = "Generic indexed parentheses column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{pmatrix}",""}),
        t(" "), i(1), t({"_{1} \\\\",""}),
        t(" "), rep(1), t({"_{2} \\\\",""}),
        t({" \\vdots \\\\",""}), 
        t(" "), rep(1), t("_{"), i(2), t({"} \\\\",""}),
        t("\\end{pmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vtfP", dscr = "Generic free parentheses column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{pmatrix}",""}),
        t(" "), i(1), t({" \\\\",""}),
        t(" "), i(2), t({" \\\\",""}),
        t({" \\vdots \\\\",""}), 
        t(" "), i(3), t({" \\\\",""}),
        t("\\end{pmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vtgB", dscr = "Generic indexed bracket column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{bmatrix}",""}),
        t(" "), i(1), t({"_{1} \\\\",""}),
        t(" "), rep(1), t({"_{2} \\\\",""}),
        t({" \\vdots \\\\",""}), 
        t(" "), rep(1), t("_{"), i(2), t({"} \\\\",""}),
        t("\\end{bmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vtfB", dscr = "Generic free bracket column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{bmatrix}",""}),
        t(" "), i(1), t({" \\\\",""}),
        t(" "), i(2), t({" \\\\",""}),
        t({" \\vdots \\\\",""}), 
        t(" "), i(3), t({" \\\\",""}),
        t("\\end{bmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vtgD", dscr = "Generic indexed bars column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{vmatrix}",""}),
        t(" "), i(1), t({"_{1} \\\\",""}),
        t(" "), rep(1), t({"_{2} \\\\",""}),
        t({" \\vdots \\\\",""}), 
        t(" "), rep(1), t("_{"), i(2), t({"} \\\\",""}),
        t("\\end{vmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vtfD", dscr = "Generic free bars column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{vmatrix}",""}),
        t(" "), i(1), t({" \\\\",""}),
        t(" "), i(2), t({" \\\\",""}),
        t({" \\vdots \\\\",""}), 
        t(" "), i(3), t({" \\\\",""}),
        t("\\end{vmatrix}")
    },
    {condition = in_mathzone}
),

-- 2x1
 
s(
{trig = "([^%a])vt2iT", dscr = "2x1 indexed table column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{matrix}",""}),
        t(" "), i(1), t({"_{1} \\\\",""}),
        t(" "), rep(1), t({"_{2} \\\\",""}),
        t("\\end{matrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vt2fT", dscr = "2x1 free table column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{matrix}",""}),
        t(" "), i(1), t({" \\\\",""}),
        t(" "), i(2), t({" \\\\",""}),
        t("\\end{matrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vt2iP", dscr = "2x1 indexed parentheses column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{pmatrix}",""}),
        t(" "), i(1), t({"_{1} \\\\",""}),
        t(" "), rep(1), t({"_{2} \\\\",""}),
        t("\\end{pmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vt2fP", dscr = "2x1 free parentheses column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{pmatrix}",""}),
        t(" "), i(1), t({" \\\\",""}),
        t(" "), i(2), t({" \\\\",""}),
        t("\\end{pmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vt2iB", dscr = "2x1 indexed bracket column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{bmatrix}",""}),
        t(" "), i(1), t({"_{1} \\\\",""}),
        t(" "), rep(1), t({"_{2} \\\\",""}),
        t("\\end{bmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vt2fB", dscr = "2x1 free bracket column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{bmatrix}",""}),
        t(" "), i(1), t({" \\\\",""}),
        t(" "), i(2), t({" \\\\",""}),
        t("\\end{bmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vt2iD", dscr = "2x1 indexed bars column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{vmatrix}",""}),
        t(" "), i(1), t({"_{1} \\\\",""}),
        t(" "), rep(1), t({"_{2} \\\\",""}),
        t("\\end{vmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vt2fD", dscr = "2x1 free bars column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{vmatrix}",""}),
        t(" "), i(1), t({" \\\\",""}),
        t(" "), i(2), t({" \\\\",""}),
        t("\\end{vmatrix}")
    },
    {condition = in_mathzone}
),

-- 3x1
 
s(
{trig = "([^%a])vt3iT", dscr = "3x1 indexed table column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{matrix}",""}),
        t(" "), i(1), t({"_{1} \\\\",""}),
        t(" "), rep(1), t({"_{2} \\\\",""}),
        t(" "), rep(1), t({"_{3} \\\\",""}),
        t("\\end{matrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vt3fT", dscr = "3x1 free table column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{matrix}",""}),
        t(" "), i(1), t({" \\\\",""}),
        t(" "), i(2), t({" \\\\",""}),
        t(" "), i(3), t({" \\\\",""}),
        t("\\end{matrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vt3iP", dscr = "3x1 indexed parentheses column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{pmatrix}",""}),
        t(" "), i(1), t({"_{1} \\\\",""}),
        t(" "), rep(1), t({"_{2} \\\\",""}),
        t(" "), rep(1), t({"_{3} \\\\",""}),
        t("\\end{pmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vt3fP", dscr = "3x1 free parentheses column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{pmatrix}",""}),
        t(" "), i(1), t({" \\\\",""}),
        t(" "), i(2), t({" \\\\",""}),
        t(" "), i(3), t({" \\\\",""}),
        t("\\end{pmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vt3iB", dscr = "3x1 indexed bracket column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{bmatrix}",""}),
        t(" "), i(1), t({"_{1} \\\\",""}),
        t(" "), rep(1), t({"_{2} \\\\",""}),
        t(" "), rep(1), t({"_{3} \\\\",""}),
        t("\\end{bmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vt3fB", dscr = "3x1 free bracket column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{bmatrix}",""}),
        t(" "), i(1), t({" \\\\",""}),
        t(" "), i(2), t({" \\\\",""}),
        t(" "), i(3), t({" \\\\",""}),
        t("\\end{bmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vt3iD", dscr = "3x1 indexed bars column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{vmatrix}",""}),
        t(" "), i(1), t({"_{1} \\\\",""}),
        t(" "), rep(1), t({"_{2} \\\\",""}),
        t(" "), rep(1), t({"_{3} \\\\",""}),
        t("\\end{vmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vt3fD", dscr = "3x1 free bars column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{vmatrix}",""}),
        t(" "), i(1), t({" \\\\",""}),
        t(" "), i(2), t({" \\\\",""}),
        t(" "), i(3), t({" \\\\",""}),
        t("\\end{vmatrix}")
    },
    {condition = in_mathzone}
),

-- 4x1
 
s(
{trig = "([^%a])vt4iT", dscr = "4x1 indexed table column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{matrix}",""}),
        t(" "), i(1), t({"_{1} \\\\",""}),
        t(" "), rep(1), t({"_{2} \\\\",""}),
        t(" "), rep(1), t({"_{3} \\\\",""}),
        t(" "), rep(1), t({"_{4} \\\\",""}),
        t("\\end{matrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vt4fT", dscr = "4x1 free table column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{matrix}",""}),
        t(" "), i(1), t({" \\\\",""}),
        t(" "), i(2), t({" \\\\",""}),
        t(" "), i(3), t({" \\\\",""}),
        t(" "), i(4), t({" \\\\",""}),
        t("\\end{matrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vt4iP", dscr = "4x1 indexed parentheses column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{pmatrix}",""}),
        t(" "), i(1), t({"_{1} \\\\",""}),
        t(" "), rep(1), t({"_{2} \\\\",""}),
        t(" "), rep(1), t({"_{3} \\\\",""}),
        t(" "), rep(1), t({"_{4} \\\\",""}),
        t("\\end{pmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vt4fP", dscr = "4x1 free table column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{pmatrix}",""}),
        t(" "), i(1), t({" \\\\",""}),
        t(" "), i(2), t({" \\\\",""}),
        t(" "), i(3), t({" \\\\",""}),
        t(" "), i(4), t({" \\\\",""}),
        t("\\end{pmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vt4iB", dscr = "4x1 indexed bracket column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{bmatrix}",""}),
        t(" "), i(1), t({"_{1} \\\\",""}),
        t(" "), rep(1), t({"_{2} \\\\",""}),
        t(" "), rep(1), t({"_{3} \\\\",""}),
        t(" "), rep(1), t({"_{4} \\\\",""}),
        t("\\end{bmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vt4fB", dscr = "4x1 free bracket column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{bmatrix}",""}),
        t(" "), i(1), t({" \\\\",""}),
        t(" "), i(2), t({" \\\\",""}),
        t(" "), i(3), t({" \\\\",""}),
        t(" "), i(4), t({" \\\\",""}),
        t("\\end{bmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vt4iD", dscr = "4x1 indexed bars column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{vmatrix}",""}),
        t(" "), i(1), t({"_{1} \\\\",""}),
        t(" "), rep(1), t({"_{2} \\\\",""}),
        t(" "), rep(1), t({"_{3} \\\\",""}),
        t(" "), rep(1), t({"_{4} \\\\",""}),
        t("\\end{vmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vt4fD", dscr = "4x1 free bars column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{vmatrix}",""}),
        t(" "), i(1), t({" \\\\",""}),
        t(" "), i(2), t({" \\\\",""}),
        t(" "), i(3), t({" \\\\",""}),
        t(" "), i(4), t({" \\\\",""}),
        t("\\end{vmatrix}")
    },
    {condition = in_mathzone}
),

-- 5x1
 
s(
{trig = "([^%a])vt5iT", dscr = "5x1 indexed table column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{matrix}",""}),
        t(" "), i(1), t({"_{1} \\\\",""}),
        t(" "), rep(1), t({"_{2} \\\\",""}),
        t(" "), rep(1), t({"_{3} \\\\",""}),
        t(" "), rep(1), t({"_{4} \\\\",""}),
        t(" "), rep(1), t({"_{5} \\\\",""}),
        t("\\end{matrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vt5fT", dscr = "5x1 free table column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{matrix}",""}),
        t(" "), i(1), t({" \\\\",""}),
        t(" "), i(2), t({" \\\\",""}),
        t(" "), i(3), t({" \\\\",""}),
        t(" "), i(4), t({" \\\\",""}),
        t(" "), i(5), t({" \\\\",""}),
        t("\\end{matrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vt5iP", dscr = "5x1 indexed parentheses column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{pmatrix}",""}),
        t(" "), i(1), t({"_{1} \\\\",""}),
        t(" "), rep(1), t({"_{2} \\\\",""}),
        t(" "), rep(1), t({"_{3} \\\\",""}),
        t(" "), rep(1), t({"_{4} \\\\",""}),
        t(" "), rep(1), t({"_{5} \\\\",""}),
        t("\\end{pmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vt5fP", dscr = "5x1 free table column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{pmatrix}",""}),
        t(" "), i(1), t({" \\\\",""}),
        t(" "), i(2), t({" \\\\",""}),
        t(" "), i(3), t({" \\\\",""}),
        t(" "), i(4), t({" \\\\",""}),
        t(" "), i(5), t({" \\\\",""}),
        t("\\end{pmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vt5iB", dscr = "5x1 indexed bracket column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{bmatrix}",""}),
        t(" "), i(1), t({"_{1} \\\\",""}),
        t(" "), rep(1), t({"_{2} \\\\",""}),
        t(" "), rep(1), t({"_{3} \\\\",""}),
        t(" "), rep(1), t({"_{4} \\\\",""}),
        t(" "), rep(1), t({"_{5} \\\\",""}),
        t("\\end{bmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vt5fB", dscr = "5x1 free bracket column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{bmatrix}",""}),
        t(" "), i(1), t({" \\\\",""}),
        t(" "), i(2), t({" \\\\",""}),
        t(" "), i(3), t({" \\\\",""}),
        t(" "), i(4), t({" \\\\",""}),
        t(" "), i(5), t({" \\\\",""}),
        t("\\end{bmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vt5iD", dscr = "5x1 indexed bars column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{vmatrix}",""}),
        t(" "), i(1), t({"_{1} \\\\",""}),
        t(" "), rep(1), t({"_{2} \\\\",""}),
        t(" "), rep(1), t({"_{3} \\\\",""}),
        t(" "), rep(1), t({"_{4} \\\\",""}),
        t(" "), rep(1), t({"_{5} \\\\",""}),
        t("\\end{vmatrix}")
    },
    {condition = in_mathzone}
),
 
s(
{trig = "([^%a])vt5fD", dscr = "5x1 free bars column vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t({"\\begin{vmatrix}",""}),
        t(" "), i(1), t({" \\\\",""}),
        t(" "), i(2), t({" \\\\",""}),
        t(" "), i(3), t({" \\\\",""}),
        t(" "), i(4), t({" \\\\",""}),
        t(" "), i(5), t({" \\\\",""}),
        t("\\end{vmatrix}")
    },
    {condition = in_mathzone}
),
}
