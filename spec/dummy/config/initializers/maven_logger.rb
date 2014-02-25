MavenLogger.setup do |config|
  # add class and class actions that should be logged
  # in locale config files should use main module or class name for action description

  config.class_actions =
    [
      [PostsController, %i[index]]
    ]
end
