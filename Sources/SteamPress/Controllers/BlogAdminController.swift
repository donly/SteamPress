import Vapor
import Authentication

struct BlogAdminController: RouteCollection {

    // MARK: - Properties
    fileprivate let pathCreator: BlogPathCreator

    // MARK: - Initialiser
    init(pathCreator: BlogPathCreator) {
        self.pathCreator = pathCreator
    }

    // MARK: - Route setup
    func boot(router: Router) throws {
        let adminRoutes = router.grouped("admin")

        let redirectMiddleware = BlogLoginRedirectAuthMiddleware(pathCreator: pathCreator)
        let adminProtectedRoutes = adminRoutes.grouped(redirectMiddleware)
        adminProtectedRoutes.get(use: adminHandler)

        let loginController = LoginController(pathCreator: pathCreator)
        try adminRoutes.register(collection: loginController)
        let postController = PostAdminController(pathCreator: pathCreator)
        try adminProtectedRoutes.register(collection: postController)
        let userController = UserAdminController(pathCreator: pathCreator)
        try adminProtectedRoutes.register(collection: userController)
    }

    // MARK: Admin Handler
    func adminHandler(_ req: Request) throws -> EventLoopFuture<View> {
        let usersRepository = try req.make(BlogUserRepository.self)
        let postsRepository = try req.make(BlogPostRepository.self)
        return flatMap(postsRepository.getAllPostsSortedByPublishDate(includeDrafts: true, on: req), usersRepository.getAllUsers(on: req)) { posts, users in
            let presenter = try req.make(BlogAdminPresenter.self)
            return try presenter.createIndexView(on: req, posts: posts, users: users, errors: nil, pageInformation: req.adminPageInfomation())
        }
    }

}
