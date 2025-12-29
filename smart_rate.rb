# smart_rate.rb
# Rate limiter simples, eficiente e sem dependências externas

class SmartRate
  def initialize(limit:, window_seconds:)
    @limit = limit
    @window = window_seconds
    @requests = {}
  end

  def allowed?(key)
    now = Time.now.to_i
    cleanup(now)

    @requests[key] ||= []
    @requests[key] << now

    @requests[key].size <= @limit
  end

  private

  def cleanup(now)
    @requests.each do |key, timestamps|
      timestamps.reject! { |t| now - t > @window }
      @requests.delete(key) if timestamps.empty?
    end
  end
end

# -------------------------
# Exemplo de uso
# -------------------------

rate_limiter = SmartRate.new(limit: 5, window_seconds: 60)

ip = "192.168.0.10"

10.times do |i|
  if rate_limiter.allowed?(ip)
    puts "Requisição #{i + 1}: permitida"
  else
    puts "Requisição #{i + 1}: BLOQUEADA (rate limit)"
  end
end
