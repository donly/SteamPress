struct AllAuthorsPageContext: Encodable {
    let pageInformation: BlogGlobalPageInformation
    let authors: [ViewBlogAuthor]
}
