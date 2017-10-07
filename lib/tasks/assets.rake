if Rake::Task.task_defined?("assets:precompile")
  Rake::Task["assets:precompile"].enhance [ "tmp:cache:clear" ]
end
