# Sets Pexels client
# client = Pexels::Client.new

puts 'Cleaning database...'
Booking.destroy_all
Instrument.destroy_all
User.destroy_all

CITIES = ['Amsterdam', 'Den Haag', 'Utrecht', 'Leiden', 'Rotterdam'].freeze
INSTRUMENTS = [
  { image_url: 'https://www.chuppspianos.com/wp-content/uploads/2021/05/Steinway-Sons-Model-45-Upright-Vertical-Piano-356674-Art-Case-Crown-Jewel-Piano.jpg', model: 'Upright Piano', brand: 'Steinway & Sons', category: 'Piano' },
  { image_url: 'https://carusopianos.com/images/stories/virtuemart/product/yamaha_dgh1b_5319498_2__1682098959_400.jpg', model: 'Baby Grand Piano', brand: 'Yamaha', category: 'Piano' },
  { image_url: 'https://upload.wikimedia.org/wikipedia/commons/9/90/Boesendorfer-5075415.jpg', model: 'Concert Grand Piano', brand: 'Bösendorfer', category: 'Piano' },
  { image_url: 'https://img.kyodonews.net/english/public/images/posts/5c9687645d0afc13a3f8a7a0a41d0ea3/image_l.jpeg', model: 'Stradivarius Violin', brand: 'Stradivarius', category: 'Violin' },
  { image_url: 'https://images.reverb.com/image/upload/s--D9BPS13I--/f_auto,t_supersize/v1617023779/pfoxkc1giu4fybagqvdy.jpg', model: 'Professional Trumpet', brand: 'Bach', category: 'Trumpet' },
  { image_url: 'https://www.drumazon.com/cdn/shop/products/PEARL-MASTERWORKS-5-PIECE-DRUM-KIT-IRIDECENT-WHITE-SPARKLE-GOLD-HARDWARE-DRUMAZON_01_1024x1024.jpg?v=1600385701', model: '5-Piece Drum Kit', brand: 'Pearl', category: 'Drums' },
  { image_url: 'https://www.hornhospital.com/main/wp-content/uploads/Yamaha-0586.jpg', model: 'Alto Saxophone', brand: 'Yamaha', category: 'Saxophone' },
  { image_url: 'https://i.ebayimg.com/images/g/mz0AAOSwQThhHEXh/s-l1200.jpg', model: 'Professional Flute', brand: 'Gemeinhardt', category: 'Flute' },
  { image_url: 'https://images.reverb.com/image/upload/s--FWsk9fMz--/f_auto,t_large/v1630085214/vtdgahn6j7coqbtg4dxr.jpg', model: 'Full-Size Cello', brand: 'D Z Strad', category: 'Cello' },
  { image_url: 'https://upload.wikimedia.org/wikipedia/commons/4/40/Andrea_Amati_violin_-_Met_Museum_NY.jpg?Amati1160988356', model: 'Viola', brand: 'Cremona', category: 'Viola' },
  { image_url: 'https://cdn.shoplightspeed.com/shops/632400/files/38628731/holton-used-holton-h180-double-french-horn.jpg', model: 'French Horn', brand: 'Holton', category: 'French Horn' },
  { image_url: 'https://i.ebayimg.com/images/g/XqgAAOSwa~5kdrRK/s-l1200.webp', model: 'Marimba', brand: 'Adams', category: 'Percussion' },
  { image_url: 'https://zingendesnaar.nl/media/catalog/product/cache/1cda160bbd810bf3aa1b6126fd0b1bbc/s/a/salvi_diana_walnoot.jpg', model: 'Pedal Harp', brand: 'Salvi', category: 'Harp' },
  { image_url: 'https://dirkwitte.nl/cdn/shop/products/DSC04103_1024x1024.jpg?v=1650974707', model: 'Les Paul', brand: 'Gibson', category: 'Guitar' },
  { image_url: 'https://www.woodstockguitars.dk/wp-content/uploads/2020/10/Fender_Stratocaster_Sunburst_1.jpg', model: 'Stratocaster', brand: 'Fender', category: 'Guitar' },
  { image_url: 'https://cdn.webshopapp.com/shops/229736/files/400505282/fender-fender-custom-shop-52-mod-journeyman-teleca.jpg', model: 'Telecaster', brand: 'Fender', category: 'Guitar' },
  { image_url: 'https://www.stars-music.nl/medias/gibson/sg-standard-1961-faded-maestro-vibrola-original-2h-trem-rw-hd-7-192081.jpg', model: 'SG', brand: 'Gibson', category: 'Guitar' },
  { image_url: 'https://max.guitars/media/catalog/product/cache/55c72fef4415145db30bd2dcfee62df6/a/r/art-20602_av_ii_66_jazz_bass_rw_wt3tb_art-20602-31173.jpg', model: 'Jazz Bass', brand: 'Fender', category: 'Bass' },
  { image_url: 'https://max.guitars/media/catalog/product/cache/55c72fef4415145db30bd2dcfee62df6/0/1/0190160806_fen_ins_frt_1_rr.jpg', model: 'Fender Precision Bass', brand: 'Fender', category: 'Bass' },
  { image_url: 'https://guitargeargiveaway.co.uk/wp-content/uploads/2023/03/Gibson-Thunderbird-Bass-in-Tobacco-Burst-01.jpg', model: 'Gibson Thunderbird', brand: 'Gibson', category: 'Bass' },
  { image_url: 'https://gsquid.b-cdn.net/wp-content/uploads/2022/04/Ibanez%20SR500%20(2).jpg', model: 'Ibanez SR500', brand: 'Ibanez', category: 'Bass' },
  { image_url: 'https://dijkmansmuziek.nl/cdn/shop/files/IMG_6544_c51d7acb-3c0f-4d95-8e01-50af6c29659d.jpg?v=1686826798&width=480', model: 'Music Man StingRay', brand: 'Music Man', category: 'Bass' },
  { image_url: 'https://static.bax-shop.nl/image/product/291642/3795537/225d9f38/1661516137_MG_9547.jpg', model: 'Warwick Thumb', brand: 'Warwick', category: 'Bass' },
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
