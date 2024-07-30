-- BibTeX entry types

return {

s({trig = "abv", name = "BibTeX abbreviation"},
    {
        t("@string{"), i(1,"key"), t(" = \""), i(2,"text to abbreviate"), t("}")
    }
),

s({trig = "art", name = "article"},
    {
        t("@article{"), i(1,"key-identifier"), t(","),
		t({"",""}), t("    "), t("author = \""), i(2,"author"), t("\","),
		t({"",""}), t("    "), t("title = \""), i(3,"title"), t("\","),
		t({"",""}), t("    "), t("journal = \""), i(4,"journal"), t("\","),
		t({"",""}), t("    "), t("year = \""), i(5,"year"), t("\","),
		t({"",""}), t("    "), t("volume = \""), i(6,"volume"), t("\","),
		t({"",""}), t("    "), t("number = \""), i(7,"number"), t("\","),
		t({"",""}), t("    "), t("pages = \""), i(8,"pages"), t("\","),
		t({"",""}), t("    "), t("month = \""), i(9,"month"), t("\","),
		t({"",""}), t("    "), t("note = \""), i(10,"note"), t("\"")
    }
),

s({trig = "bks", name = "book"},
    {
        t("@book{"), i(1,"key-identifier"), t(","),
		t({"",""}), t("    "), t("author = \""), i(2,"author"), t("\","),
		t({"",""}), t("    "), t("editor = \""), i(3,"editor"), t("\","),
		t({"",""}), t("    "), t("title = \""), i(4,"title"), t("\","),
		t({"",""}), t("    "), t("publisher = \""), i(5,"publisher"), t("\","),
		t({"",""}), t("    "), t("year = \""), i(6,"year"), t("\","),
		t({"",""}), t("    "), t("volume = \""), i(7,"volume"), t("\","),
		t({"",""}), t("    "), t("number = \""), i(8,"number"), t("\","),
		t({"",""}), t("    "), t("series = \""), i(9,"series"), t("\","),
		t({"",""}), t("    "), t("address = \""), i(10,"address"), t("\","),
		t({"",""}), t("    "), t("edition = \""), i(11,"edition"), t("\","),
		t({"",""}), t("    "), t("month = \""), i(12,"month"), t("\","),
		t({"",""}), t("    "), t("note = \""), i(13,"note"), t("\"")
    }
),

s({trig = "bkl", name = "booklet"},
    {
        t("@booklet{"), i(1,"key-identifier"), t(","),
		t({"",""}), t("    "), t("title = \""), i(2),"title"), t("\","),
		t({"",""}), t("    "), t("author = \""), i(3,"author"), t("\","),
		t({"",""}), t("    "), t("howpublished = \""), i(4,"howpublished"), t("\","),
		t({"",""}), t("    "), t("address = \""), i(5,"address"), t("\","),
		t({"",""}), t("    "), t("month = \""), i(6,"month"), t("\","),
		t({"",""}), t("    "), t("year = \""), i(7,"year"), t("\","),
		t({"",""}), t("    "), t("note = \""), i(8,"note"), t("\"")
    }
),

s({trig = "ibk", name = "inbook"},
    {
        t("@inbook{"), i(1,"key-identifier"), t(","),
		t({"",""}), t("    "), t("author = \""), i(2,"author"), t("\","),
		t({"",""}), t("    "), t("editor = \""), i(3,"editor"), t("\","),
		t({"",""}), t("    "), t("title = \""), i(4,"title"), t("\","),
		t({"",""}), t("    "), t("chapter = \""), i(5,"chapter"), t("\","),
		t({"",""}), t("    "), t("pages = \""), i(6,"pages"), t("\","),
		t({"",""}), t("    "), t("publisher = \""), i(7,"publisher"), t("\","),
		t({"",""}), t("    "), t("year = \""), i(8,"year"), t("\","),
		t({"",""}), t("    "), t("volume = \""), i(9,"volume"), t("\","),
		t({"",""}), t("    "), t("number = \""), i(10,"number"), t("\","),
		t({"",""}), t("    "), t("series = \""), i(11,"series"), t("\","),
		t({"",""}), t("    "), t("type = \""), i(12,"type"), t("\","),
		t({"",""}), t("    "), t("address = \""), i(13,"address"), t("\","),
		t({"",""}), t("    "), t("edition = \""), i(14,"edition"), t("\","),
		t({"",""}), t("    "), t("month = \""), i(15,"month"), t("\","),
		t({"",""}), t("    "), t("note = \""), i(16,"note"), t("\"")
    }
),

s({trig = "inc", name = "incollection"},
    {
        t("@incollection{"), i(1,"key-identifier"), t(","),
		t({"",""}), t("    "), t("author = \""), i(2,"author"), t("\","),
		t({"",""}), t("    "), t("title = \""), i(3,"title"), t("\","),
		t({"",""}), t("    "), t("booktitle = \""), i(4,"booktitle"), t("\","),
		t({"",""}), t("    "), t("publisher = \""), i(5,"publisher"), t("\","),
		t({"",""}), t("    "), t("year = \""), i(6,"year"), t("\","),
		t({"",""}), t("    "), t("editor = \""), i(7,"editor"), t("\","),
		t({"",""}), t("    "), t("volume = \""), i(8,"volume"), t("\","),
		t({"",""}), t("    "), t("number = \""), i(9,"number"), t("\","),
		t({"",""}), t("    "), t("series = \""), i(10,"series"), t("\","),
		t({"",""}), t("    "), t("type = \""), i(11,"type"), t("\","),
		t({"",""}), t("    "), t("chapter = \""), i(12,"chapter"), t("\","),
		t({"",""}), t("    "), t("pages = \""), i(13,"pages"), t("\","),
		t({"",""}), t("    "), t("address = \""), i(14,"address"), t("\","),
		t({"",""}), t("    "), t("edition = \""), i(15,"edition"), t("\","),
		t({"",""}), t("    "), t("month = \""), i(16,"month"), t("\","),
		t({"",""}), t("    "), t("note = \""), i(17,"note"), t("\"")
    }
),

s({trig = "inp", name = "inproceedings"},
    {
        t("@inproceedings{"), i(1,"key-identifier"), t(","),
		t({"",""}), t("    "), t("author = \""), i(2,"author"), t("\","),
		t({"",""}), t("    "), t("title = \""), i(3,"title"), t("\","),
		t({"",""}), t("    "), t("booktitle = \""), i(4,"booktitle"), t("\","),
		t({"",""}), t("    "), t("year = \""), i(5,"year"), t("\","),
		t({"",""}), t("    "), t("editor = \""), i(6,"editor"), t("\","),
		t({"",""}), t("    "), t("volume = \""), i(7,"volume"), t("\","),
		t({"",""}), t("    "), t("number = \""), i(8,"number"), t("\","),
		t({"",""}), t("    "), t("series = \""), i(9,"series"), t("\","),
		t({"",""}), t("    "), t("pages = \""), i(10,"pages"), t("\","),
		t({"",""}), t("    "), t("address = \""), i(11,"address"), t("\","),
		t({"",""}), t("    "), t("month = \""), i(12,"month"), t("\","),
		t({"",""}), t("    "), t("organization = \""), i(13,"organization"), t("\","),
		t({"",""}), t("    "), t("edition = \""), i(14,"edition"), t("\","),
		t({"",""}), t("    "), t("publisher = \""), i(15,"publisher"), t("\","),
		t({"",""}), t("    "), t("note = \""), i(16,"note"), t("\"")
    }
),

s({trig = "man", name = "manual"},
    {
        t("@manual{"), i(1,"key-identifier"), t(","),
		t({"",""}), t("    "), t("title = \""), i(2,"title"), t("\","),
		t({"",""}), t("    "), t("author = \""), i(3,"author"), t("\","),
		t({"",""}), t("    "), t("organization = \""), i(4,"organization"), t("\","),
		t({"",""}), t("    "), t("address = \""), i(5,"address"), t("\","),
		t({"",""}), t("    "), t("edition = \""), i(6,"edition"), t("\","),
		t({"",""}), t("    "), t("month = \""), i(7,"month"), t("\","),
		t({"",""}), t("    "), t("year = \""), i(8,"year"), t("\","),
		t({"",""}), t("    "), t("note = \""), i(9,"note"), t("\"")
    }
),

s({trig = "mst", name = "masterthesis"},
    {
        t("@masterthesis{"), i(1,"key-identifier"), t(","),
		t({"",""}), t("    "), t("author = \""), i(2,"author"), t("\","),
		t({"",""}), t("    "), t("title = \""), i(3,"title"), t("\","),
		t({"",""}), t("    "), t("school = \""), i(4,"school"), t("\","),
		t({"",""}), t("    "), t("year = \""), i(5,"year"), t("\","),
		t({"",""}), t("    "), t("type = \""), i(6,"type"), t("\","),
		t({"",""}), t("    "), t("address = \""), i(7,"address"), t("\","),
		t({"",""}), t("    "), t("month = \""), i(8,"month"), t("\","),
		t({"",""}), t("    "), t("note = \""), i(9,"note"), t("\"")
    }
),

s({trig = "mis", name = "misc"},
    {
        t("@misc{"), i(1,"key-identifier"), t(","),
		t({"",""}), t("    "), t("author = \""), i(2,"author"), t("\","),
		t({"",""}), t("    "), t("title = \""), i(3,"title"), t("\","),
		t({"",""}), t("    "), t("howpublished = \""), i(4,"howpublished"), t("\","),
		t({"",""}), t("    "), t("month = \""), i(5,"month"), t("\","),
		t({"",""}), t("    "), t("year = \""), i(6,"year"), t("\","),
		t({"",""}), t("    "), t("note = \""), i(7,"note"), t("\"")
    }
),

s({trig = "phd", name = "phdthesis"},
    {
        t("@phdthesis{"), i(1,"key-identifier"), t(","),
		t({"",""}), t("    "), t("author = \""), i(2,"author"), t("\","),
		t({"",""}), t("    "), t("title = \""), i(3,"title"), t("\","),
		t({"",""}), t("    "), t("school = \""), i(4,"school"), t("\","),
		t({"",""}), t("    "), t("year = \""), i(5,"year"), t("\","),
		t({"",""}), t("    "), t("type = \""), i(6,"type"), t("\","),
		t({"",""}), t("    "), t("address = \""), i(7,"address"), t("\","),
		t({"",""}), t("    "), t("month = \""), i(8,"month"), t("\","),
		t({"",""}), t("    "), t("note = \""), i(9,"note"), t("\"")
    }
),

s({trig = "pcd", name = "proceeding"},
    {
        t("@proceedings{"), i(1,"key-identifier"), t(","),
		t({"",""}), t("    "), t("title = \""), i(2,"title"), t("\","),
		t({"",""}), t("    "), t("year = \""), i(3,"year"), t("\","),
		t({"",""}), t("    "), t("editor = \""), i(4,"editor"), t("\","),
		t({"",""}), t("    "), t("volume = \""), i(5,"volume"), t("\","),
		t({"",""}), t("    "), t("number = \""), i(6,"number"), t("\","),
		t({"",""}), t("    "), t("series = \""), i(7,"series"), t("\","),
		t({"",""}), t("    "), t("address = \""), i(8,"address"), t("\","),
		t({"",""}), t("    "), t("publisher = \""), i(9,"publisher"), t("\","),
		t({"",""}), t("    "), t("note = \""), i(10,"note"), t("\"")
		t({"",""}), t("    "), t("month = \""), i(11,"month"), t("\","),
		t({"",""}), t("    "), t("organization = \""), i(12,"organization"), t("\"")
    }
),

s({trig = "tec", name = "techreport"},
    {
        t("@techreport{"), i(1,"key-identifier"), t(","),
		t({"",""}), t("    "), t("author = \""), i(2,"author"), t("\","),
		t({"",""}), t("    "), t("title = \""), i(3,"title"), t("\","),
		t({"",""}), t("    "), t("institution = \""), i(4,"institution"), t("\","),
		t({"",""}), t("    "), t("year = \""), i(5,"year"), t("\","),
		t({"",""}), t("    "), t("type = \""), i(6,"type"), t("\","),
		t({"",""}), t("    "), t("number = \""), i(7,"number"), t("\","),
		t({"",""}), t("    "), t("address = \""), i(8,"address"), t("\","),
		t({"",""}), t("    "), t("month = \""), i(9,"month"), t("\","),
		t({"",""}), t("    "), t("note = \""), i(10,"note"), t("\"")
    }
),

s({trig = "unp", name = "unpublished"},
    {
        t("@unpublished{"), i(1,"key-identifier"), t(","),
		t({"",""}), t("    "), t("author = \""), i(2,"author"), t("\","),
		t({"",""}), t("    "), t("title = \""), i(3,"title"), t("\","),
		t({"",""}), t("    "), t("note = \""), i(4,"note"), t("\",")
		t({"",""}), t("    "), t("month = \""), i(5,"month"), t("\","),
		t({"",""}), t("    "), t("year = \""), i(6,"year"), t("\"")
    }
),

}
