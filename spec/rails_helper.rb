# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'webmock/rspec'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

  # configures factory bots in testing
  config.include FactoryBot::Syntax::Methods
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.filter_sensitive_data('<movie_api_key>') { ENV['movie_api_key'] }
  config.default_cassette_options = { re_record_interval: 7.days }
  config.allow_http_connections_when_no_cassette = true
end

def data
  {:adult=>false,
  :backdrop_path=>"/vRQnzOn4HjIMX4LBq9nHhFXbsSu.jpg",
  :belongs_to_collection=>
   {:id=>119,
    :name=>"The Lord of the Rings Collection",
    :poster_path=>"/nSNle6UJNNuEbglNvXt67m1a1Yn.jpg",
    :backdrop_path=>"/bccR2CGTWVVSZAG0yqmy3DIvhTX.jpg"},
  :budget=>93000000,
  :genres=>[{:id=>12, :name=>"Adventure"}, {:id=>14, :name=>"Fantasy"}, {:id=>28, :name=>"Action"}],
  :homepage=>"http://www.lordoftherings.net/",
  :id=>120,
  :imdb_id=>"tt0120737",
  :original_language=>"en",
  :original_title=>"The Lord of the Rings: The Fellowship of the Ring",
  :overview=>
   "Young hobbit Frodo Baggins, after inheriting a mysterious ring from his uncle Bilbo, must leave his home in order to keep it from falling into the hands of its evil creator. Along the way, a fellowship is formed to protect the ringbearer and make sure that the ring arrives at its final destination: Mt. Doom, the only place where it can be destroyed.",
  :popularity=>95.299,
  :poster_path=>"/6oom5QYQ2yQTMJIbnvbkBL9cHo6.jpg",
  :production_companies=>
   [{:id=>12, :logo_path=>"/iaYpEp3LQmb8AfAtmTvpqd4149c.png", :name=>"New Line Cinema", :origin_country=>"US"},
    {:id=>11, :logo_path=>"/6FAuASQHybRkZUk08p9PzSs9ezM.png", :name=>"WingNut Films", :origin_country=>"NZ"},
    {:id=>5237, :logo_path=>nil, :name=>"The Saul Zaentz Company", :origin_country=>"US"}],
  :production_countries=>[{:iso_3166_1=>"NZ", :name=>"New Zealand"}, {:iso_3166_1=>"US", :name=>"United States of America"}],
  :release_date=>"2001-12-18",
  :revenue=>871368364,
  :runtime=>179,
  :spoken_languages=>[{:english_name=>"English", :iso_639_1=>"en", :name=>"English"}],
  :status=>"Released",
  :tagline=>"One ring to rule them all",
  :title=>"The Lord of the Rings: The Fellowship of the Ring",
  :video=>false,
  :vote_average=>8.4,
  :vote_count=>20083}
end 

def data_2
  {:id=>120,
  :cast=>
  [{:adult=>false,
    :gender=>2,
    :id=>109,
    :known_for_department=>"Acting",
    :name=>"Elijah Wood",
    :original_name=>"Elijah Wood",
    :popularity=>6.583,
    :profile_path=>"/7UKRbJBNG7mxBl2QQc5XsAh6F8B.jpg",
    :cast_id=>28,
    :character=>"Frodo Baggins",
    :credit_id=>"52fe421ac3a36847f800448f",
    :order=>0},
   {:adult=>false,
    :gender=>2,
    :id=>1327,
    :known_for_department=>"Acting",
    :name=>"Ian McKellen",
    :original_name=>"Ian McKellen",
    :popularity=>4.886,
    :profile_path=>"/5cnnnpnJG6TiYUSS7qgJheUZgnv.jpg",
    :cast_id=>29,
    :character=>"Gandalf",
    :credit_id=>"52fe421ac3a36847f8004493",
    :order=>1},
   {:adult=>false,
    :gender=>1,
    :id=>882,
    :known_for_department=>"Acting",
    :name=>"Liv Tyler",
    :original_name=>"Liv Tyler",
    :popularity=>7.216,
    :profile_path=>"/9IlcL0MWSNz8YLzqSooRHCQD4Dt.jpg",
    :cast_id=>31,
    :character=>"Arwen",
    :credit_id=>"52fe421ac3a36847f800449b",
    :order=>2},
   {:adult=>false,
    :gender=>2,
    :id=>110,
    :known_for_department=>"Acting",
    :name=>"Viggo Mortensen",
    :original_name=>"Viggo Mortensen",
    :popularity=>13.082,
    :profile_path=>"/vH5gVSpHAMhDaFWfh0Q7BG61O1y.jpg",
    :cast_id=>30,
    :character=>"Aragorn",
    :credit_id=>"52fe421ac3a36847f8004497",
    :order=>3},
   {:adult=>false,
    :gender=>2,
    :id=>48,
    :known_for_department=>"Acting",
    :name=>"Sean Bean",
    :original_name=>"Sean Bean",
    :popularity=>18.737,
    :profile_path=>"/kTjiABk3TJ3yI0Cto5RsvyT6V3o.jpg",
    :cast_id=>34,
    :character=>"Boromir",
    :credit_id=>"52fe421ac3a36847f80044a7",
    :order=>4},
   {:adult=>false,
    :gender=>2,
    :id=>1328,
    :known_for_department=>"Acting",
    :name=>"Sean Astin",
    :original_name=>"Sean Astin",
    :popularity=>4.364,
    :profile_path=>"/5oJzy6Ra0tuMEV7mfxjtqye5qUX.jpg",
    :cast_id=>36,
    :character=>"Sam",
    :credit_id=>"52fe421ac3a36847f80044af",
    :order=>5},
   {:adult=>false,
    :gender=>1,
    :id=>112,
    :known_for_department=>"Acting",
    :name=>"Cate Blanchett",
    :original_name=>"Cate Blanchett",
    :popularity=>8.018,
    :profile_path=>"/vUuEHiAR0eD3XEJhg2DWIjymUAA.jpg",
    :cast_id=>40,
    :character=>"Galadriel",
    :credit_id=>"52fe421ac3a36847f80044bf",
    :order=>6},
   {:adult=>false,
    :gender=>2,
    :id=>655,
    :known_for_department=>"Acting",
    :name=>"John Rhys-Davies",
    :original_name=>"John Rhys-Davies",
    :popularity=>5.318,
    :profile_path=>"/dvT1NPY8CXIVQh0O1h6rpfYOgKz.jpg",
    :cast_id=>33,
    :character=>"Gimli",
    :credit_id=>"52fe421ac3a36847f80044a3",
    :order=>7},
   {:adult=>false,
    :gender=>2,
    :id=>1329,
    :known_for_department=>"Acting",
    :name=>"Billy Boyd",
    :original_name=>"Billy Boyd",
    :popularity=>2.839,
    :profile_path=>"/uiWlsIOakNnUgda21PJF9wswzEJ.jpg",
    :cast_id=>37,
    :character=>"Pippin",
    :credit_id=>"52fe421ac3a36847f80044b3",
    :order=>8},
   {:adult=>false,
    :gender=>2,
    :id=>1330,
    :known_for_department=>"Acting",
    :name=>"Dominic Monaghan",
    :original_name=>"Dominic Monaghan",
    :popularity=>3.645,
    :profile_path=>"/7X0JzecoAwLXyftU1p0Ha5D9BpU.jpg",
    :cast_id=>38,
    :character=>"Merry",
    :credit_id=>"52fe421ac3a36847f80044b7",
    :order=>9},
   {:adult=>false,
    :gender=>2,
    :id=>114,
    :known_for_department=>"Acting",
    :name=>"Orlando Bloom",
    :original_name=>"Orlando Bloom",
    :popularity=>5.309,
    :profile_path=>"/pulwUR0lZ8IWwXUCRXCnyWfYvNL.jpg",
    :cast_id=>32,
    :character=>"Legolas",
    :credit_id=>"52fe421ac3a36847f800449f",
    :order=>10}
  ]
}
end 

def data_3
  {:id=>120,
 :page=>1,
 :results=>
  [{:author=>"NeoBrowser",
    :author_details=>{:name=>"", :username=>"NeoBrowser", :avatar_path=>nil, :rating=>10.0},
    :content=>
     "Brooking no argument, history should quickly regard Peter Jackson’s The Fellowship Of The Ring as the first instalment of the best fantasy epic in motion picture history. This statement is worthy of investigation for several reasons.\r\n\r\nFellowship is indeed merely an opening salvo, and even after three hours in the dark you will likely exit the cinema ravenous with anticipation for the further two parts of the trilogy. Fellowship is also unabashedly rooted in the fantasy genre. Not to be confused with the techno-cool of good science fiction, nor even the cutesy charm of family fare like Harry Potter, the territory of Tolkien is clearly marked by goo and goblins and gobbledegook. Persons with an aversion to lines such as, “To the bridge of Khazad-dûm!” are as well to stay within the Shire-like comforts of home (their loss).\r\n\r\nWith those caveats in place, it bears repeating: fantasy does not come finer. There are electrifying moments — notably the computer-assisted swooping camera through Isengard as it transforms into a factory for evil — when Jackson’s flight of fancy approaches the sublime as the romantic poets would understand it: inspiring awe.\r\n\r\nLeaving aside the thorny issue of Tolkien die-hards and their inevitable gripes — “What no Tom Bombadil?” — Jackson’s screenplay (written in collaboration with Fran Walsh and Phillipa Boyens) is both bolder and more judicious than Steven Kloves’ surprisingly timid retread of Harry Potter. In particular, rescuing the romance of Arwen and Aragorn from the footnotes and the elevation of Saruman to all-action bad guy actually has a corrective influence on Tolkien’s often oblique and female-sparse source material.\r\n\r\nThere are problems, though. The three-hour running time is high on incident and low on discernible form. After successive detours to Elf habitats Rivendell (the watery home of Elrond) and Lothlórien (the forest home of the Lady Galadriel), the uninitiated might well ask why these crazy Elf kids can’t just live together and spare us all this attenuated dramatic structure.\r\n\r\nMore importantly, the action clearly climaxes in the desperate flight from the Mines Of Moria, where the largely seamless SFX is showcased in the best possible light — total darkness — but the narrative demands a different, downbeat ending. Indeed, but for some fine emotional playing from Bean, Mortensen, Astin and Wood, the final fight might feel like a particularly brutal game of paintball in Bluebell Wood. But then, the real battles are yet to come...\r\n\r\n\r\nVerdict - Putting formula blockbusters to shame, Fellowship is impeccably cast and constructed with both care and passion: this is a labour of love that never feels laboured. Emotional range and character depth ultimately take us beyond genre limitations, and it deserves to play as wide as a certain Mr. Potter.\r\n\r\n5/5\r\n\r\n- Colin Kennedy, Empire Magazine",
    :created_at=>"2013-07-20T09:00:20.421Z",
    :id=>"51ea51a4760ee3602024a27e",
    :updated_at=>"2021-06-23T15:57:21.813Z",
    :url=>"https://www.themoviedb.org/review/51ea51a4760ee3602024a27e"},
   {:author=>"gdeveloper",
    :author_details=>{:name=>"", :username=>"gdeveloper", :avatar_path=>nil, :rating=>10.0},
    :content=>"An epic movie if I ever saw one. Captivating and just plain fun to watch. This movie is, indeed, art.",
    :created_at=>"2017-11-01T09:25:22.233Z",
    :id=>"59f99302c3a3682d7b0111da",
    :updated_at=>"2021-06-23T15:58:02.301Z",
    :url=>"https://www.themoviedb.org/review/59f99302c3a3682d7b0111da"},
   {:author=>"Wuchak",
    :author_details=>{:name=>"", :username=>"Wuchak", :avatar_path=>"/4KVM1VkqmXLOuwj1jjaSdxbvBDk.jpg", :rating=>7.0},
    :content=>
     "Tolkien’s adventure/fantasy LOOKS and SOUNDS fabulous, but is not without flaws.\r\n\r\nRELEASED 2001 and directed by Pete
r Jackson, “The Lord of the Rings: The Fellowship of the Ring” adapts the first part of JRR Tolkien’s popular fantasy trilogy ab
out adventures on Middle-Earth. The story starts in the homeland of the Hobbits (innocent, diminutive humanoids) where Frodo (El
ijah Wood) is instructed by the noble wizard Gandalf (Ian McKellen) to quickly leave the Shire with the powerful One Ring in his
 possession. Gandalf and Frodo are later accompanied by seven others, the titular ‘Fellowship of the Ring,’ to take the ring to
the only place it can be destroyed, the fires of Mount Doom in Mordor. \r\n\r\nThe rest of the main cast include Sean Astin (Sam
), Viggo Mortensen (Aragorn), Sean Bean (Boromir), Christopher Lee (Saruman), Orlando Bloom (Legolas), John Rhys-Davies (Gimli)
and Hugo Weaving (Elrond).        \r\n\r\nThis three-hour fantasy features a diverse cast of colorful characters, quaint beings
and settings, moments of genuine wonder, dark ee-vil creatures, high adventure, thrilling brutal action, a superb score, magnifi
cent locations (forests, mountains, rivers, etc.), and wondrous CGI sets. The film LOOKS and SOUNDS so great that it’d be sinful
 to give it a lower rating. \r\n\r\nThere are problems, however, at least for those who aren’t uber-fans of Tolkien. For one, th
e opening is hindered by prologue that is overlong and convoluted, not to mention unnecessary. The bulk of it could’ve been conv
eyed later via flashback, which they do a little bit anyway. Secondly, the story takes forever to build any drive. Thirdly, exce
pt for maybe Frodo and Gandalf, the characters are shallow and I didn’t care much what happened to them. Fourthly, main protagon
ists getting seriously wounded and everyone else expressing their melodramatic concern gets redundant.  \r\n\r\nFifthly, there a
re only two females in the main cast (Liv Tyler as Arwen, a half-Elf princess, and Cate Blanchett as Galadriel, a royal Elf); un
fortunately, their parts aren’t much more than glorified cameos. “Mythica: A Quest for Heroes” (2014) cost LESS THAN $100,000 to
 make, which is a mere fraction of the $93 million it cost to make this blockbuster and the filmmakers knew enough to include a
couple of prominent babes as key protagonists in the story. \r\n\r\nDespite these negatives, “The Fellowship of the Ring” is the
 best of the trilogy and is a must for fantasy/adventure aficionados, especially Tolkien fans.                      \r\n\r\nTHE
MOVIE RUNS 2 hours 58 minutes and was shot in New Zealand. \r\n\r\nGRADE: B/B- (6.5/10)",
    :created_at=>"2018-03-10T04:43:57.981Z",
    :id=>"5aa3628dc3a3687bfc004d51",
    :updated_at=>"2021-06-23T15:58:06.651Z",
    :url=>"https://www.themoviedb.org/review/5aa3628dc3a3687bfc004d51"},
   {:author=>"LadyGreenEyes",
    :author_details=>
     {:name=>"",
      :username=>"LadyGreenEyes",
      :avatar_path=>"/https://secure.gravatar.com/avatar/2c8a5db65821bf3d00f6a8964d2a96c7.jpg",
      :rating=>8.0},
    :content=>
     "Overall, I give this four stars.  Not five, because some of the changes really bug me, as a long-time Tolkien fan, but a s
olid four.  \r\n\r\nThe casting, to start, was brilliant.  Sean Astin was the absolute perfect choice for Sam, and did a remarka
ble job bringing that character to life for us.  He really WAS Sam, in this role, in a very deep way.  I always liked his acting
, but here, he showed how talented he actually is.  Just amazing.  Elijah Wood gives a great performance of Frodo, and those exp
ressive eyes of his really add a lot of depth to the emotions the character goes through, which are such an important part of th
e story.  Billy Boyd and Dominic Monaghan both did great work, for our other two main hobbits.  Their smiles, their singing; jus
t every aspect of these characters was so real.  Viggo Mortensen, of course, was excellent.  He's always good, and though I neve
r would have pictures him as Aragorn, he delivered everything we could hope for.  Great choice for that role!  John Rhys-Davies,
 as expected, gave us the Gimli we wanted.  Phenomenal actor, and I can't imagine anyone doing that role better.  Orlando Bloom
plays a convincing Legolas, and handles the nuances of being an elf quite well.  Sean Bean as Boromir was outstanding, bringing
the strength of that character to life, and making us love him.  Then we have Ian McKellen, as Gandalf.  I could never have chos
en someone for that role, but the casting folks hit a home run with this one.  Everything about his character was just right.  L
iterally everything.  I can't read the books without seeing these people in these roles now.  The rest of the cast ws good as we
ll.\r\n\r\nThen we have the setting.  New Zealand has to have some of the most utterly gorgeous scenery on the planet.  Seeing i
t in these movies was great, and convincingly Middle Earth, and seeing more since, in other videos, just WOW!  Thanks, to the pe
ople of New Zealand, for allowing this to be filmed there!  \r\n\r\nThe sets were just fantastic.  Everything looked as good as
I'd always hoped it would look, with all the charm, mystery, and wonder  Tolkien fan could hope for.  From Bag end to Rivendell
to the vastness of \r\nMiddle Earth, everything we saw was just right.  \r\n\r\nThe only issues I had were some of the changes.
 Yes, I know things don't always work in movies as they do in books, but when whole sections are just omitted, that bothers me.
 It's not like the movies weren't long already!  That omitted section, with which Tolkien fans will be quite familiar, was a ver
y important part of the plot!  I also didn't care for some of the other changes, and the way Arwen was used, the scene at the ri
ver being one example.  \r\n\r\nAll in all, though, this was a well done movie, and even though some things bug me, this film, a
nd the rest of the series, will be viewed many times.  Classics, worth collecting and treasuring.",
    :created_at=>"2018-12-16T01:43:33.548Z",
    :id=>"5c15adc5c3a36866cc3713d9",
    :updated_at=>"2021-06-23T15:58:15.124Z",
    :url=>"https://www.themoviedb.org/review/5c15adc5c3a36866cc3713d9"},
   {:author=>"JPV852",
    :author_details=>{:name=>"", :username=>"JPV852", :avatar_path=>"/xNLOqXXVJf9m7WngUMLIMFsjKgh.jpg", :rating=>9.0},
    :content=>
     "Lost count how many times I've seen the \"The Fellowship of the Ring\" but still fantastic after all these years, epic on
every level and just all around entertaining, the 3.5 running time just flies by. Will be watching \"The Two Towers\" either ton
ight or tomorrow followed by \"The Return of the King\". **4.75/5**",
    :created_at=>"2020-09-13T22:54:36.297Z",
    :id=>"5f5ea32c156cc70038db737b",
    :updated_at=>"2021-06-23T15:58:44.357Z",
    :url=>"https://www.themoviedb.org/review/5f5ea32c156cc70038db737b"},
   {:author=>"Peter McGinn",
    :author_details=>
     {:name=>"Peter McGinn", :username=>"narrator56", :avatar_path=>"/tVbrLJzA2RwRlE7dJLJG54UsAkq.jpg", :rating=>8.0},
    :content=>
     "Well, I wouldn’t read this review if you are a true fan of fantasy adventure epics, because I am not. Don’t get me wrong,
I like this movie and have watched it a few times over the years, but I have watched  (or read, for that matter) very little els
e in the fantasy  genre. I didn’t get too far into the Game of Thrones as the violent rapes got old for me fast. \r\n\r\nSo I wa
tched this first entry of the Lord of the Rings trilogy as just a viewer, not a fan, and I liked it just fine. The complex plot
held together well and the scenery was gorgeous. There was violence, but not gore, and for those who don’t like war movies, ther
e wasn’t as much of it here as there is in the other two films of the trilogy.\r\n\r\nI gather the elfin roles for women were en
larged and brought to the fore, and why not; women were mostly good for setting mead and large pieces of rare meat down on table
s in front of their warrior men.\r\n\r\nI must confess, I found it jarring that the warriors like Strider were so invincible, wa
lking into a horde of sixty orcs and scattering them like toy soldiers with his sword. I know they are epic heroes, but if I’m a
n orc, I stand back and throw something or whatever, but it is similar to the old legends with semi-gods like Achilles, back whe
n Hector was a pup.\r\n\r\nI am not going to compare the film to the book — I read it decades ago when I was in high school. It
is worth watching and though real fans will take this with a large grain of salt, I think it is possibly the definitive adaptati
on of the book. (I need to watch the other two entries in the series before I say the same about those.) if you are among the 12
on of the book. (I need to watch the other two entries in the series before I say the same about those.) if you are among the 12
% percent of movie goers who haven’t seen it, give it a try.",
    :created_at=>"2020-11-09T21:03:49.600Z",
    :id=>"5fa9aeb521621d003ff9c55f",
    :updated_at=>"2021-06-23T15:58:47.326Z",
    :url=>"https://www.themoviedb.org/review/5fa9aeb521621d003ff9c55f"},
   {:author=>"r96sk",
    :author_details=>
     {:name=>"",
      :username=>"r96sk",
      :avatar_path=>"/https://secure.gravatar.com/avatar/96c2e0e4ac98450f9e8e3c0a0a40aad8.jpg",
      :rating=>10.0},
    :content=>
     "Magnificent! A great start to the franchise.\r\n\r\n<em>'The Lord of the Rings'</em> is yet another film series that I am
incredibly late to viewing, at least I've finally got around to it... albeit almost twenty years on from this film's release.\r\
n\r\n<em>'The Lord of the Rings: The Fellowship of the Ring'</em> is delightful. I never know what to expect from a film that go
es on for nearly three hours, the pacing has to be near perfection for it to work - and boy does it here. The run time flew by,
which is always a terrific sign.\r\n\r\nI love a load of things about this, the one that actually sticks out most is the outstan
ding score. Music can play a huge part in how much I enjoy a film, so I'm delighted to say that the score is here is fantastic.
That is by no means the only positive, obviously.\r\n\r\nThe cast are excellent. Elijah Wood gives a strong performance in the l
ead role. I've seen Wood in others things down the years and have actually found him a bit hit-and-miss, but here he is very goo
d. Elsewhere, I really enjoyed watching Viggo Mortensen's character.\r\n\r\nAway from those two, there are a whole host of notew
orthy cast members. Orlando Bloom, or Will Turner to me, is involved, as are the likes of Ian McKellen and Sean Bean. I also lik
ed Liv Tyler in her role.\r\n\r\nThe look of the film is spectacular, and has aged extremely well even to this day. Everything f
rom the cinematography to the costumes is brilliant, those two things really make the film come alive - helped by the aforementi
oned score, of course.\r\n\r\nVery eager to check out the sequels, prequels and, eventually, the upcoming television series.",
    :created_at=>"2021-02-16T01:24:27.766Z",
    :id=>"602b1ecbab5e34003f9ffdfc",
    :updated_at=>"2021-06-23T15:58:51.794Z",
    :url=>"https://www.themoviedb.org/review/602b1ecbab5e34003f9ffdfc"}],
 :total_pages=>1,
 :total_results=>7}
end 