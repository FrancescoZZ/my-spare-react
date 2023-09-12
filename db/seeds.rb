# Sets Pexels client
# client = Pexels::Client.new

puts 'Cleaning database...'
Booking.destroy_all
Instrument.destroy_all
User.destroy_all

CITIES = ['Amsterdam', 'Den Haag', 'Utrecht', 'Leiden', 'Rotterdam'].freeze
INSTRUMENTS = [
  { image_url: '/images/1.jpg', model: 'Jazz Bass', brand: 'Fender', category: 'Bass' },
  { image_url: '/images/2.jpg', model: 'Viola', brand: 'Cremona', category: 'Viola' },
  { image_url: '/images/3.jpg', model: 'Concert Grand Piano', brand: 'Bösendorfer', category: 'Piano' },
  { image_url: '/images/4.jpg', model: 'Les Paul', brand: 'Gibson', category: 'Guitar' },
  { image_url: '/images/5.jpg', model: 'Telecaster', brand: 'Fender', category: 'Guitar' },
  { image_url: '/images/6.jpg', model: 'Gibson Thunderbird', brand: 'Gibson', category: 'Bass' },
  { image_url: '/images/7.jpg', model: 'French Horn', brand: 'Holton', category: 'French Horn' },
  { image_url: '/images/8.jpg', model: 'Ibanez SR500', brand: 'Ibanez', category: 'Bass' },
  { image_url: '/images/9.jpeg', model: 'Stradivarius Violin', brand: 'Stradivarius', category: 'Violin' },
  { image_url: '/images/10.jpg', model: 'Music Man StingRay', brand: 'Music Man', category: 'Bass' },
  { image_url: '/images/11.jpg', model: 'Fender Precision Bass', brand: 'Fender', category: 'Bass' },
  { image_url: '/images/12.jpg', model: '5-Piece Drum Kit', brand: 'Pearl', category: 'Drums' },
  { image_url: '/images/13.jpg', model: 'Professional Trumpet', brand: 'Bach', category: 'Trumpet' },
  { image_url: '/images/14.jpg', model: 'Professional Flute', brand: 'Gemeinhardt', category: 'Flute' },
  { image_url: '/images/15.webp', model: 'Marimba', brand: 'Adams', category: 'Percussion' },
  { image_url: '/images/16.jpg', model: 'Pedal Harp', brand: 'Salvi', category: 'Harp' },
  { image_url: '/images/17.jpg', model: 'SG', brand: 'Gibson', category: 'Guitar' },
  { image_url: '/images/18.jpg', model: 'Upright Piano', brand: 'Steinway & Sons', category: 'Piano' },
  { image_url: '/images/19.jpg', model: 'Full-Size Cello', brand: 'D Z Strad', category: 'Cello' },
  { image_url: '/images/20.jpg', model: 'Baby Grand Piano', brand: 'Yamaha', category: 'Piano' },
  { image_url: '/images/21.jpg', model: 'Alto Saxophone', brand: 'Yamaha', category: 'Saxophone' },
  { image_url: '/images/22.jpg', model: 'Stratocaster', brand: 'Fender', category: 'Guitar' },
  { image_url: '/images/23.jpg', model: 'Warwick Thumb', brand: 'Warwick', category: 'Bass' },
].freeze

# Admin user here, do not delete from seed
puts 'making admin user'
User.new(
  email: 'admin@email.com',
  password: 'password',
  first_name: 'Francesco',
  last_name: 'Zeno',
  city: 'Amsterdam'
).save

# The following are normal users:
7.times do |i|
  User.new(
    email: "user#{i}@email.com",
    password: 'password',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: CITIES.sample
  ).save
end

10.times do |i|
  User.create!(
    email: "owner#{i}@email.com",
    password: 'password',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: CITIES.sample
  )
end


puts "Seeded #{User.count} users."

INSTRUMENTS.shuffle.each do |data|
  model = data[:model]

  case data[:category]
  when 'Piano'
    description = "Experience the rich harmonies and dynamic range of the #{model}. Crafted by #{data[:brand]}, this #{model} captures the essence of classical and contemporary music alike. Its exquisite construction ensures every note resonates with clarity, whether you're playing passionate sonatas or gentle melodies. The responsive keys offer pianists precise control over their expression, while the craftsmanship guarantees a lasting instrument for generations to come."

  when 'Violin'
    description = "Discover the enchanting tones of the #{model} by #{data[:brand]}. Revered for its impeccable craftsmanship, this #{model} is a testament to the legacy of master luthiers. From its gracefully carved body to the delicate scrollwork, every detail embodies a tradition of excellence. Whether you're performing intricate concertos or heartfelt melodies, this violin's resonant sound will captivate both players and listeners alike."

  when 'Trumpet'
    description = "Unleash your musical brilliance with the #{model} from #{data[:brand]}. Crafted to perfection, this professional trumpet delivers exceptional tonal clarity and powerful projection. Whether you're playing jazz, classical, or modern compositions, the #{model} ensures a versatile and expressive performance. Its precision-engineered valves and responsive slides guarantee smooth playing across all registers, making it a reliable choice for musicians of all levels."

  when 'Drums'
    description = "Elevate your rhythm with the #{model} drum kit by #{data[:brand]}. Engineered for the discerning drummer, this kit delivers a harmonious blend of tone and resonance. With a robust foundation provided by the kick drum, versatile toms, and crisp snare, the #{model} offers a canvas for your creative beats. Crafted from quality materials, these drums respond with precision to your every stroke, making them an essential companion for any genre or performance setting."

  when 'Saxophone'
    description = "Introducing the #{model} saxophone from #{data[:brand]}. A masterpiece of design and engineering, this saxophone offers a warm and expressive tone that resonates with emotion. From smooth jazz to energetic funk, the #{model} adapts seamlessly to any musical style. The ergonomically designed keys provide effortless playability, while the impeccable intonation ensures that you're always in tune with your music. With its rich heritage and contemporary innovation, this saxophone is a true embodiment of musical artistry."

  when 'Flute'
    description = "Evoke enchanting melodies with the #{model} flute by #{data[:brand]}. Renowned for its exquisite craftsmanship, this flute offers a delicate balance of clarity and warmth. Its precision-crafted mechanism ensures effortless key action, allowing flutists to explore a wide range of dynamics and expression. From delicate solos to orchestral passages, the #{model} flute remains a cherished choice for musicians seeking an instrument that blends tradition with modernity."

  when 'Cello'
    description = "Discover the soulful resonance of the #{model} cello from #{data[:brand]}. Crafted with meticulous attention to detail, this full-size cello delivers a deep and resonant tone that resonates through the heart. The #{model}'s hand-carved construction produces a distinctive character, making it an instrument of choice for soloists and ensemble players alike. Its comfortable playability and rich tonal palette ensure that you can bring forth a wide range of emotions, whether performing classical masterpieces or contemporary compositions."

  when 'Clarinet'
    description = "Immerse yourself in the melodious world of the #{model} clarinet by #{data[:brand]}. Renowned for its refined tone and effortless playability, this clarinet is a testament to the artistry of woodwind craftsmanship. With each note, the #{model} clarinet captures the essence of classical and modern genres, delivering a seamless blend of expression and precision. Whether you're performing on stage or in the studio, this clarinet's exceptional resonance and clarity make it a versatile and reliable companion for musicians of all levels."

  when 'Bass'
    description = "Experience the driving pulse of the #{model} bass guitar by #{data[:brand]}. Designed to anchor the rhythm with power and precision, this bass guitar offers a deep, resonant tone that provides a solid foundation for any musical genre. Whether you're playing funk grooves, rock anthems, or intricate basslines, the #{model} bass guitar ensures that your performance is felt as much as it's heard. Its comfortable playability and dynamic range make it an essential tool for bassists seeking both versatility and stage presence."

  else
    description = "Explore the musical possibilities with the #{model} from #{data[:brand]}. Crafted to deliver exceptional performance, this #{data[:category].downcase} offers a perfect balance of form and function. Whether you're a professional musician or an aspiring beginner, the #{model} ensures that your musical journey is filled with inspiration and creativity. With its reliable construction, nuanced tones, and comfortable playability, the #{model} is a worthy addition to any player's repertoire."
  end

  Instrument.create!(
    model: data[:model],
    brand: data[:brand],
    category: data[:category],
    city: CITIES.sample,
    daily_price: rand(20..450),
    description: description,
    image_url: data[:image_url],
    user_id: User.find_by(email: "owner#{rand(0..9)}@email.com").id
  )
end
# 5.times do |i|
#   User.new(
#     email: "owner#{i}@email.com",
#     password: "password",
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     city: CITIES.sample
#   ).save!
#   2.times do
#     random_instrument = Faker::Music.instrument
#     Instrument.new(
#       model: Faker::Music.genre,
#       brand: Faker::Ancient.god,
#       category: random_instrument,
#       city: CITIES.sample,
#       daily_price: rand(0..200),
#       description: Faker::Quotes::Shakespeare.hamlet_quote,
#       image_url: client.photos.search(random_instrument).to_a.sample.src["medium"],
#       user_id: User.last.id
#     ).save!
#   end
# end

puts "Seeded #{Instrument.count} instruments."

puts 'Generating bookings'
20.times do
  user = User.order('RANDOM()').limit(1).first
  instrument = Instrument.order('RANDOM()').limit(1).first
  start_date = Date.today + rand(0..14)
  end_date = start_date + rand(0..4)
  booking = Booking.new(start_date: start_date, end_date: end_date, user: user, instrument: instrument)
  booking.save! if booking.valid?
end
puts 'Bookings created!'
puts "Seeded #{Booking.count} bookings."
