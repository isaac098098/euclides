local in_mathzone = function()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return {

-- Inline

s(
	{trig = "([^%a])mm", dscr = "Inline math mode", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{t(" $"), i(1), t("$")}
),

s(
	{trig = "([^%a])dis", dscr = "Displaystyle", snippetType="autosnippet", regTrig = true, wordTrig = false},
    {f( function(_, snip) return snip.captures[1] end ), t("\\displaystyle ")},
    {condition = in_mathzone}

),

-- Lists

s(
	{trig = "([^%a])it", dscr = "New item", regTrig = true, wordTrig = false},
	{t({"","\\item "}), i(1)}
),

s(
	{trig = "([^%a])tz", dscr = "Itemize", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
		t({"","\\begin{itemize}\\adjustpenalty","    \\item "}), 
		i(1), 
		t({"","\\end{itemize}"}),
		i(2)
	}
),

s(
	{trig = "([^%a])enumn", dscr = "Arabic ennumerate", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
		t({"","\\begin{enumerate}[label=\\textnormal{(\\arabic*)}]\\adjustpenalty","    \\item "}), 
		i(1), 
		t({"","\\end{enumerate}"}),
		i(2)
	}
),

s(
	{trig = "([^%a])enumi", dscr = "Roman lowercase ennnumerate", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
		t({"","\\begin{enumerate}[label=\\textnormal{(\\roman*)}]\\adjustpenalty","    \\item "}), 
		i(1), 
		t({"","\\end{enumerate}"}),
		i(2)
	}
),

s(
	{trig = "([^%a])enumI", dscr = "Roman uppercase ennnumerate", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
		t({"","\\begin{enumerate}[label=\\textnormal{(\\Roman*)}]\\adjustpenalty","    \\item "}), 
		i(1), 
		t({"","\\end{enumerate}"}),
		i(2)
	}
),

s(
	{trig = "([^%a])enuma", dscr = "Alphanumeric lowercase ennnumerate", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
		t({"","\\begin{enumerate}[label=\\textnormal{(\\alph*)}]\\adjustpenalty","    \\item "}), 
		i(1), 
		t({"","\\end{enumerate}"}),
		i(2)
	}
),

s(
	{trig = "([^%a])enumA", dscr = "Alphanumeric lowercase ennnumerate", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
		t({"","\\begin{enumerate}[label=\\textnormal{(\\Alph*)}]\\adjustpenalty","    \\item "}), 
		i(1), 
		t({"","\\end{enumerate}"}),
		i(2)
	}
),

-- Equations

s(
	{trig = "([^%a])nn", dscr = "Unnumbered equation", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
		t({"","\\begin{equation*}","    "}), 
		i(1), 
		t({"","\\end{equation*}"}),
		i(2)
	}
),

s(
	{trig = "([^%a])nm", dscr = "Numbered equation", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
		t({"","\\begin{equation}","    "}), 
		i(1), 
		t({"","\\end{equation}"}),
		i(2)
	}
),

s(
	{trig = "([^%a])aa", dscr = "Aligned enviroment", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
		t({"","\\begin{align*}","    "}), 
		i(1), 
		t({"","\\end{align*}"}),
		i(2)
	}
),

s(
	{trig = "([^%a])gg", dscr = "Gathered enviroment", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
		t({"","\\begin{gather*}","    "}), 
		i(1), 
		t({"","\\end{gather*}"}),
		i(2)
	}
),

-- Theorems

s(
	{trig = "([^%a])th", dscr = "Theorem", regTrig = true, wordTrig = false},
	{
		t({"","\\begin{theorem}",""}), 
		i(1), 
		t({"","\\end{theorem}"}),
		i(2)
	}
),

s(
	{trig = "([^%a])Th", dscr = "Theorem with note", regTrig = true, wordTrig = false},
	{
		t({"","\\begin{theorem}["}),
		i(1),
		t({"]",""}), 
		i(2), 
		t({"","\\end{theorem}"}),
		i(3)
	}
),

s(
	{trig = "([^%a])pn", dscr = "Proposition", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
		t({"","\\begin{proposition}",""}), 
		i(1), 
		t({"","\\end{proposition}"}),
		i(2)
	}
),

s(
	{trig = "([^%a])Pn", dscr = "Proposition with note", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
		t({"","\\begin{proposition}["}),
		i(1),
		t({"]",""}), 
		i(2), 
		t({"","\\end{proposition}"}),
		i(3)
	}
),

s(
	{trig = "([^%a])cc", dscr = "Corollary", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
		t({"","\\begin{corollary}",""}), 
		i(1), 
		t({"","\\end{corollary}"}),
		i(2)
	}
),

s(
	{trig = "([^%a])Cc", dscr = "Corollary with note", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
		t({"","\\begin{corollary}["}),
		i(1),
		t({"]",""}), 
		i(2), 
		t({"","\\end{corollary}"}),
		i(3)
	}
),

s(
	{trig = "([^%a])lm", dscr = "Lemma", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
		t({"","\\begin{lemma}",""}), 
		i(1), 
		t({"","\\end{lemma}"}),
		i(2)
	}
),

s(
	{trig = "([^%a])Lm", dscr = "Lema with note", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
		t({"","\\begin{lemma}["}),
		i(1),
		t({"]",""}), 
		i(2), 
		t({"","\\end{lemma}"}),
		i(3)
	}
),

s(
	{trig = "([^%a])def", dscr = "Definition", regTrig = true, wordTrig = false},
	{
		t({"","\\begin{definition}",""}), 
		i(1), 
		t({"","\\end{definition}"}),
		i(2)
	}
),

s(
	{trig = "([^%a])Def", dscr = "Definition with note", regTrig = true, wordTrig = false},
	{
		t({"","\\begin{definition}["}),
		i(1),
		t({"]",""}), 
		i(2), 
		t({"","\\end{definition}"}),
		i(3)
	}
),

s(
	{trig = "([^%a])rm", dscr = "Remark", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
		t({"","\\begin{remark}",""}), 
		i(1), 
		t({"","\\end{remark}"}),
		i(2)
	}
),

s(
	{trig = "([^%a])pr", dscr = "Proof", regTrig = true, wordTrig = false},
	{
		t({"","\\begin{proof}",""}), 
		i(1), 
		t({"","\\end{proof}"}),
		i(2)
	}
),

s(
	{trig = "([^%a])ee", dscr = "Exercise", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
		t({"","\\begin{exercise}",""}), 
		i(1), 
		t({"","\\end{exercise}"}),
		i(2)
	}
),

s(
	{trig = "([^%a])Ee", dscr = "Exercise with note", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
		t({"","\\begin{exercise}["}),
		i(1),
		t({"]",""}), 
		i(2), 
		t({"","\\end{exercise}"}),
		i(3)
	}
),

s(
	{trig = "([^%a])ej", dscr = "Example", regTrig = true, wordTrig = false},
	{
		t({"","\\begin{example}",""}), 
		i(1), 
		t({"","\\end{example}"}),
		i(2)
	}
),

-- Tables

s(
	{trig = "([^%a])lh", dscr = "Table horizontal line", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{f( function(_, snip) return snip.captures[1] end ),t({"","\\hline",""})}
),

s(
	{trig = "([^%a])mtC", dscr = "Multicolumn in centered table", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\multicolumn{"), i(1), t("}{|c|}{"), i(2), t("}")
    }
),

s(
	{trig = "([^%a])mtS", dscr = "Multicolumn in inner cell spacing table", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        f( function(_, snip) return snip.captures[1] end ),
        t("\\multicolumn{"), i(1), t("}{|Sc|}{"), i(2), t("}")
    }
),

-- Native tables

s(
	{trig = "([^%a])tbCCL", dscr = "Centered table with caption and label", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        t({"","","\\begin{table}[h]",""}),
        t({"\\centering",""}),
        t({"\\begin{tabular}[\\textwidth]{|*{"}), i(1), t({"}{c|}}",""}),
        t({"    \\hline",""}),
        t("    "), i(4), t(" \\\\"), i(5),
        t({"","    \\hline",""}),
        t({"\\end{tabular}",""}),
        t("\\caption{"), i(2), t({"}",""}),
        t("\\label{tab:"), i(3), t({"}",""}),
        t("\\end{table}"), i(6)
	}
),

s(
	{trig = "([^%a])tbCcL", dscr = "Centered table with no caption and label", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        t({"","","\\begin{table}[h]",""}),
        t({"\\centering",""}),
        t({"\\begin{tabular}[\\textwidth]{|*{"}), i(1), t({"}{c|}}",""}),
        t({"    \\hline",""}),
        t("    "), i(3), t(" \\\\"), i(4),
        t({"","    \\hline",""}),
        t({"\\end{tabular}",""}),
        t("\\label{tab:"), i(2), t({"}",""}),
        t("\\end{table}"), i(5)
	}
),

s(
	{trig = "([^%a])tbCCl", dscr = "Centered table with caption and no label", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        t({"","","\\begin{table}[h]",""}),
        t({"\\centering",""}),
        t({"\\begin{tabular}[\\textwidth]{|*{"}), i(1), t({"}{c|}}",""}),
        t({"    \\hline",""}),
        t("    "), i(3), t(" \\\\"), i(4),
        t({"","    \\hline",""}),
        t({"\\end{tabular}",""}),
        t("\\caption{"), i(2), t({"}",""}),
        t("\\end{table}"), i(5)
	}
),

s(
	{trig = "([^%a])tbCcl", dscr = "Centered table with no caption and no label", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        t({"","","\\begin{table}[h]",""}),
        t({"\\centering",""}),
        t({"\\begin{tabular}[\\textwidth]{|*{"}), i(1), t({"}{c|}}",""}),
        t({"    \\hline",""}),
        t("    "), i(2), t(" \\\\"), i(3),
        t({"","    \\hline",""}),
        t({"\\end{tabular}",""}),
        t("\\end{table}"), i(4)
	}
),

-- Tables with inner cell spacing

s(
	{trig = "([^%a])tbSCL", dscr = "Table with inner cell spacing, caption and label", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        t({"","","\\begin{table}[h]",""}),
        t({"\\centering",""}),
        t({"\\begin{tabular}[\\textwidth]{|*{"}), i(1), t({"}{Sc|}}",""}),
        t({"    \\hline",""}),
        t("    "), i(4), t(" \\\\"), i(5),
        t({"","    \\hline",""}),
        t({"\\end{tabular}",""}),
        t("\\caption{"), i(2), t({"}",""}),
        t("\\label{tab:"), i(3), t({"}",""}),
        t("\\end{table}"), i(6)
	}
),

s(
	{trig = "([^%a])tbScL", dscr = "Table with inner cell spacing, no caption and label", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        t({"","","\\begin{table}[h]",""}),
        t({"\\centering",""}),
        t({"\\begin{tabular}[\\textwidth]{|*{"}), i(1), t({"}{Sc|}}",""}),
        t({"    \\hline",""}),
        t("    "), i(3), t(" \\\\"), i(4),
        t({"","    \\hline",""}),
        t({"\\end{tabular}",""}),
        t("\\label{tab:"), i(2), t({"}",""}),
        t("\\end{table}"), i(5)
	}
),

s(
	{trig = "([^%a])tbSCl", dscr = "Table with inner cell spacing, caption and no label", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        t({"","","\\begin{table}[h]",""}),
        t({"\\centering",""}),
        t({"\\begin{tabular}[\\textwidth]{|*{"}), i(1), t({"}{Sc|}}",""}),
        t({"    \\hline",""}),
        t("    "), i(3), t(" \\\\"), i(4),
        t({"","    \\hline",""}),
        t({"\\end{tabular}",""}),
        t("\\caption{"), i(2), t({"}",""}),
        t("\\end{table}"), i(5)
	}
),

s(
	{trig = "([^%a])tbScl", dscr = "Table with inner cell spacing, no caption and no label", snippetType="autosnippet", regTrig = true, wordTrig = false},
	{
        t({"","","\\begin{table}[h]",""}),
        t({"\\centering",""}),
        t({"\\begin{tabular}[\\textwidth]{|*{"}), i(1), t({"}{Sc|}}",""}),
        t({"    \\hline",""}),
        t("    "), i(2), t(" \\\\"), i(3),
        t({"","    \\hline",""}),
        t({"\\end{tabular}",""}),
        t("\\end{table}"), i(4)
	}
),
}
