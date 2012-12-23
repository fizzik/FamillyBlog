namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    ban = User.create!(:name => "Example User",
                       :email => "example@railstutorial.org",
                       :password => "foobar",
                       :password_confirmation => "foobar")
    ban.toggle!(:ban)

  end
end

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Example User",
                         :email => "example@railstutorial.org",
                         :password => "foobar",
                         :password_confirmation => "foobar")
    admin.toggle!(:admin)

        end
end


module ReputationSystem
  module ReputationMethods
    def reputation_for(reputation_name, *args)
      find_reputation(reputation_name, args.first).value
    end

    def normalized_reputation_for(reputation_name, *args)
      find_reputation(reputation_name, args.first).normalized_value
    end

    def activate_all_reputations
      ReputationSystem::Reputation.find(:all, :conditions => {:target_id => self.id, :target_type => self.class.name, :active => false}).each do |r|
        r.active = true
        r.save!
      end
    end

    def deactivate_all_reputations
      ReputationSystem::Reputation.find(:all, :conditions => {:target_id => self.id, :target_type => self.class.name, :active => true}).each do |r|
        r.active = false
        r.save!
      end
    end

    def reputations_activated?(reputation_name)
      r = ReputationSystem::Reputation.find(:first, :conditions => {:reputation_name => reputation_name.to_s, :target_id => self.id, :target_type => self.class.name})
      r ? r.active : false
    end

    def rank_for(reputation_name, *args)
      scope = args.first
      my_value = self.reputation_for(reputation_name, scope)
      self.class.count_with_reputation(reputation_name, scope, :all,
                                       :conditions => ["rs_reputations.value > ?", my_value]
      ) + 1
    end

    protected
    def find_reputation(reputation_name, scope)
      raise ArgumentError, "#{reputation_name} is not valid" if !self.class.has_reputation_for?(reputation_name)
      srn = ReputationSystem::Network.get_scoped_reputation_name(self.class.name, reputation_name, scope)
      process = ReputationSystem::Network.get_reputation_def(self.class.name, srn)[:aggregated_by]
      ReputationSystem::Reputation.find_or_create_reputation(srn, self, process)
    end
  end
end