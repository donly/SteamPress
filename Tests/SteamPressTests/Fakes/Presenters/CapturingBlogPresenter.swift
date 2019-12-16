import SteamPress
import Vapor

import Foundation

class CapturingBlogPresenter: BlogPresenter {

    // MARK: - BlogPresenter
    private(set) var indexPosts: [BlogPost]?
    private(set) var indexTags: [BlogTag]?
    private(set) var indexAuthors: [BlogUser]?
    private(set) var indexPageInformation: BlogGlobalPageInformation?
    func indexView(on container: Container, posts: [BlogPost], tags: [BlogTag], authors: [BlogUser], pageInformation: BlogGlobalPageInformation) -> EventLoopFuture<View> {
        self.indexPosts = posts
        self.indexTags = tags
        self.indexAuthors = authors
        self.indexPageInformation = pageInformation
        return TestDataBuilder.createFutureView(on: container)
    }

    private(set) var post: BlogPost?
    private(set) var postAuthor: BlogUser?
    private(set) var postPageInformation: BlogGlobalPageInformation?
    #warning("Page Info")
    func postView(on container: Container, post: BlogPost, author: BlogUser, pageInformation: BlogGlobalPageInformation) -> EventLoopFuture<View> {
        self.post = post
        self.postAuthor = author
        self.postPageInformation = pageInformation
        return TestDataBuilder.createFutureView(on: container)
    }

    private(set) var allAuthors: [BlogUser]?
    private(set) var allAuthorsPostCount: [Int: Int]?
    #warning("Page Info")
    func allAuthorsView(on container: Container, authors: [BlogUser], authorPostCounts: [Int: Int], pageInformation: BlogGlobalPageInformation) -> EventLoopFuture<View> {
        self.allAuthors = authors
        self.allAuthorsPostCount = authorPostCounts
        return TestDataBuilder.createFutureView(on: container)
    }

    private(set) var author: BlogUser?
    private(set) var authorPosts: [BlogPost]?
    private(set) var authorPostCount: Int?
    #warning("Page Info")
    func authorView(on container: Container, author: BlogUser, posts: [BlogPost], postCount: Int, pageInformation: BlogGlobalPageInformation) -> EventLoopFuture<View> {
        self.author = author
        self.authorPosts = posts
        self.authorPostCount = postCount
        return TestDataBuilder.createFutureView(on: container)
    }

    private(set) var allTagsPageTags: [BlogTag]?
    private(set) var allTagsPagePostCount: [Int: Int]?
    #warning("Page Info")
    func allTagsView(on container: Container, tags: [BlogTag], tagPostCounts: [Int: Int], pageInformation: BlogGlobalPageInformation) -> EventLoopFuture<View> {
        self.allTagsPageTags = tags
        self.allTagsPagePostCount = tagPostCounts
        return TestDataBuilder.createFutureView(on: container)
    }

    private(set) var tag: BlogTag?
    private(set) var tagPosts: [BlogPost]?
    #warning("Page Info")
    func tagView(on container: Container, tag: BlogTag, posts: [BlogPost], pageInformation: BlogGlobalPageInformation) -> EventLoopFuture<View> {
        self.tag = tag
        self.tagPosts = posts
        return TestDataBuilder.createFutureView(on: container)
    }

    private(set) var searchPosts: [BlogPost]?
    private(set) var searchTerm: String?
    #warning("Page Info")
    func searchView(on container: Container, posts: [BlogPost], searchTerm: String?, pageInformation: BlogGlobalPageInformation) -> EventLoopFuture<View> {
        self.searchPosts = posts
        self.searchTerm = searchTerm
        return TestDataBuilder.createFutureView(on: container)
    }

    private(set) var loginWarning: Bool?
    private(set) var loginErrors: [String]?
    private(set) var loginUsername: String?
    private(set) var loginUsernameError: Bool?
    private(set) var loginPasswordError: Bool?
    #warning("Page Info")
    func loginView(on container: Container, loginWarning: Bool, errors: [String]?, username: String?, usernameError: Bool, passwordError: Bool, pageInformation: BlogGlobalPageInformation) -> EventLoopFuture<View> {
        self.loginWarning = loginWarning
        self.loginErrors = errors
        self.loginUsername = username
        self.loginUsernameError = usernameError
        self.loginPasswordError = passwordError
        return TestDataBuilder.createFutureView(on: container)
    }
}