roxy.package(
  pck.source.dir = "~/GitHub/OnLevel"
  , pck.version = "0.01-1"
  , R.libs = "~/R"
  , repo.root = "~/GitHub/OnLevel/repo"
  , pck.description = data.frame(
    Package = "OnLevel"
    , Type = "Package"
    , Title = "On Level"
    , Author = "Brian Fannin <BFannin@RedwoodsGroup.com>"
    , AuthorsR = "c(person(given = \"Brian\", family = \"Fannin\"
                  , email = \"BFannin@RedwoodsGroup.com\"
                  , role = c(\"aut\", \"cre\")))"
    , Maintainer = "Brian Fannin <BFannin@RedwoodsGroup.com>"
    , Depends = "R (>= 2.11.0)"
    , License = "GPL (>= 3)"
    , Encoding = "UTF-8"
    , LazyLoad = "yes"
    , stringsAsFactors = FALSE)
  , actions = c("roxy"
                , "cite"
                , "html"
                , "license"
                , "package"))

