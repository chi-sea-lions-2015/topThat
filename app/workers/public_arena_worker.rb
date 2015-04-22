class PublicArenaWorker
  include Sidekiq::Worker

  def perform(arena_id)
    arena = PublicArena.find(arena_id)
    if arena.close?
   #send a message
    end
  end
end



