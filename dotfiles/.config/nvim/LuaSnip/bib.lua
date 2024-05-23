return{
s(
    {trig = "book", dscr = "Bibtex book"},
    {
        t("@book{"), i(1), t({",",""}),
        t("    author = {"), i(2), t({"},",""}), 
        t("    title = {"), i(3), t({"},",""}), 
        t("    publisher = {"), i(4), t({"},",""}), 
        t("    edition = {"), i(5), t({"},",""}), 
        t("    year = {"), i(6), t({"},",""}), 
        t("    ISBN = {"), i(7), t({"}","}"}), 
    }
),

s(
    {trig = "paper", dscr = "Bibtex paper"},
    {
        t("@article{"), i(1), t({",",""}),
        t("    author = {"), i(2), t({"},",""}), 
        t("    title = {"), i(3), t({"},",""}), 
        t("    journal= {"), i(4), t({"},",""}), 
        t("    publisher = {"), i(5), t({"},",""}), 
        t("    year = {"), i(6), t({"},",""}), 
        t("    volume = {"), i(7), t({"},",""}), 
        t("    number = {"), i(8), t({"},",""}), 
        t("    pages = {"), i(9), t({"}",""}), 
    }
),

s(
    {trig = "web", dscr = "Bibtex website"},
    {
        t("@misc{"), i(1), t({",",""}),
        t("    author = {"), i(2), t({"},",""}), 
        t("    title = {"), i(3), t({"},",""}), 
        t("    year = {"), i(4), t({"},",""}), 
        t("    note = {"), i(5), t({"}",""}), 
    }
),

s(
    {trig = "phd", dscr = "Bibtex PhD thesis"},
    {
        t("@misc{"), i(1), t({",",""}),
        t("    author = {"), i(2), t({"},",""}), 
        t("    title = {"), i(3), t({"},",""}), 
        t("    school= {"), i(4), t({"},",""}), 
        t("    year = {"), i(5), t({"}",""}), 
    }
),
}
