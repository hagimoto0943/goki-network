namespace :fight_status do
  desc 'fightのstatusをdoneに変更する'
  task change_to_be_done: :environment do
    Fight.progress.timeout_status.find_each(&:done!)
  end
end
