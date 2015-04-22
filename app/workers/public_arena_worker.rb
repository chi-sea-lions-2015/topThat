class PublicArenaWorker
  include Sidekiq::Worker

  def perform(arena_id)
    arena = PublicArena.find(arena_id)
    arena.close
  end
end



