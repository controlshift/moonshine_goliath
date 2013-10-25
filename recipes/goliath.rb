namespace :god do
  namespace :goliath do
    desc "start goliath workers"
    task :start, :roles => :goliath do
      sudo "god start #{fetch(:application)}-goliath || true"
    end
    desc "stop goliath workers"
    task :stop, :roles => :goliath do
      sudo "god stop #{fetch(:application)}-goliath || true"
    end
    desc "restart goliath workers"
    task :restart, :roles => :goliath do
      sudo "god restart #{fetch(:application)}-goliath || true"
    end

    desc "show status of goliath workers"
    task :status, :roles => :goliath do
      sudo "god status #{fetch(:application)}-goliath || true"
    end
  end
end
