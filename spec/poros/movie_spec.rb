require 'rails_helper'

RSpec.describe Movie do 
  let(:movie) { Movie.new(data, data_2, data_3) }
  it 'has attributes' do  
    expect(movie.movie_id).to eq(120)
    expect(movie.movie_title).to eq("The Lord of the Rings: The Fellowship of the Ring")
    expect(movie.duration).to eq(179)
    expect(movie.vote_average).to eq(8.4)
    expect(movie.genres).to be_an(Array)
    expect(movie.genres[0][:name]).to eq("Adventure")
    expect(movie.summary).to eq("Young hobbit Frodo Baggins, after inheriting a mysterious ring from his uncle Bilbo, must leave his home in order to keep it from falling into the hands of its evil creator. Along the way, a fellowship is formed to protect the ringbearer and make sure that the ring arrives at its final destination: Mt. Doom, the only place where it can be destroyed.")
    expect(movie.cast).to be_an(Array)
    expect(movie.cast[0][:name]).to eq("Elijah Wood")
    expect(movie.cast[0][:character]).to eq("Frodo Baggins")
    expect(movie.reviews).to be_an(Array)
    expect(movie.reviews[0][:author]).to eq("NeoBrowser")
    expect(movie.reviews[0][:content]).to eq("Brooking no argument, history should quickly regard Peter Jackson’s The Fellowship Of The Ring as the first instalment of the best fantasy epic in motion picture history. This statement is worthy of investigation for several reasons.\r\n\r\nFellowship is indeed merely an opening salvo, and even after three hours in the dark you will likely exit the cinema ravenous with anticipation for the further two parts of the trilogy. Fellowship is also unabashedly rooted in the fantasy genre. Not to be confused with the techno-cool of good science fiction, nor even the cutesy charm of family fare like Harry Potter, the territory of Tolkien is clearly marked by goo and goblins and gobbledegook. Persons with an aversion to lines such as, “To the bridge of Khazad-dûm!” are as well to stay within the Shire-like comforts of home (their loss).\r\n\r\nWith those caveats in place, it bears repeating: fantasy does not come finer. There are electrifying moments — notably the computer-assisted swooping camera through Isengard as it transforms into a factory for evil — when Jackson’s flight of fancy approaches the sublime as the romantic poets would understand it: inspiring awe.\r\n\r\nLeaving aside the thorny issue of Tolkien die-hards and their inevitable gripes — “What no Tom Bombadil?” — Jackson’s screenplay (written in collaboration with Fran Walsh and Phillipa Boyens) is both bolder and more judicious than Steven Kloves’ surprisingly timid retread of Harry Potter. In particular, rescuing the romance of Arwen and Aragorn from the footnotes and the elevation of Saruman to all-action bad guy actually has a corrective influence on Tolkien’s often oblique and female-sparse source material.\r\n\r\nThere are problems, though. The three-hour running time is high on incident and low on discernible form. After successive detours to Elf habitats Rivendell (the watery home of Elrond) and Lothlórien (the forest home of the Lady Galadriel), the uninitiated might well ask why these crazy Elf kids can’t just live together and spare us all this attenuated dramatic structure.\r\n\r\nMore importantly, the action clearly climaxes in the desperate flight from the Mines Of Moria, where the largely seamless SFX is showcased in the best possible light — total darkness — but the narrative demands a different, downbeat ending. Indeed, but for some fine emotional playing from Bean, Mortensen, Astin and Wood, the final fight might feel like a particularly brutal game of paintball in Bluebell Wood. But then, the real battles are yet to come...\r\n\r\n\r\nVerdict - Putting formula blockbusters to shame, Fellowship is impeccably cast and constructed with both care and passion: this is a labour of love that never feels laboured. Emotional range and character depth ultimately take us beyond genre limitations, and it deserves to play as wide as a certain Mr. Potter.\r\n\r\n5/5\r\n\r\n- Colin Kennedy, Empire Magazine")
    expect(movie.image).to eq("/6oom5QYQ2yQTMJIbnvbkBL9cHo6.jpg")
  end 

  describe 'instance methods' do
    describe '#characters' do 
      it 'gets the first 10 characters for a specific movie' do 
        expected = [{:name=>"Elijah Wood", :character=>"Frodo Baggins"},
        {:name=>"Ian McKellen", :character=>"Gandalf"},
        {:name=>"Liv Tyler", :character=>"Arwen"},
        {:name=>"Viggo Mortensen", :character=>"Aragorn"},
        {:name=>"Sean Bean", :character=>"Boromir"},
        {:name=>"Sean Astin", :character=>"Sam"},
        {:name=>"Cate Blanchett", :character=>"Galadriel"},
        {:name=>"John Rhys-Davies", :character=>"Gimli"},
        {:name=>"Billy Boyd", :character=>"Pippin"},
        {:name=>"Dominic Monaghan", :character=>"Merry"}]

        expect(movie.characters(data_2)).to be_an(Array)
        expect(movie.characters(data_2)).to eq(expected)
      end 
    end 

    describe '#review' do 
      it 'returns the author and content for all reviews for a movie' do
        expected = [{:author=>"NeoBrowser",
        :content=>
         "Brooking no argument, history should quickly regard Peter Jackson’s The Fellowship Of The Ring as the first instalment of the best fantasy epic in motion picture history. This statement is worthy of investigation for several reasons.\r\n\r\nFellowship is indeed merely an opening salvo, and even after three hours in the dark you will likely exit the cinema ravenous with anticipation for the further two parts of the trilogy. Fellowship is also unabashedly rooted in the fantasy genre. Not to be confused with the techno-cool of good science fiction, nor even the cutesy charm of family fare like Harry Potter, the territory of Tolkien is clearly marked by goo and goblins and gobbledegook. Persons with an aversion to lines such as, “To the bridge of Khazad-dûm!” are as well to stay within the Shire-like comforts of home (their loss).\r\n\r\nWith those caveats in place, it bears repeating: fantasy does not come finer. There are electrifying moments — notably the computer-assisted swooping camera through Isengard as it transforms into a factory for evil — when Jackson’s flight of fancy approaches the sublime as the romantic poets would understand it: inspiring awe.\r\n\r\nLeaving aside the thorny issue of Tolkien die-hards and their inevitable gripes — “What no Tom Bombadil?” — Jackson’s screenplay (written in collaboration with Fran Walsh and Phillipa Boyens) is both bolder and more judicious than Steven Kloves’ surprisingly timid retread of Harry Potter. In particular, rescuing the romance of Arwen and Aragorn from the footnotes and the elevation of Saruman to all-action bad guy actually has a corrective influence on Tolkien’s often oblique and female-sparse source material.\r\n\r\nThere are problems, though. The three-hour running time is high on incident and low on discernible form. After successive detours to Elf habitats Rivendell (the watery home of Elrond) and Lothlórien (the forest home of the Lady Galadriel), the uninitiated might well ask why these crazy Elf kids can’t just live together and spare us all this attenuated dramatic structure.\r\n\r\nMore importantly, the action clearly climaxes in the desperate flight from the Mines Of Moria, where the largely seamless SFX is showcased in the best possible light — total darkness — but the narrative demands a different, downbeat ending. Indeed, but for some fine emotional playing from Bean, Mortensen, Astin and Wood, the final fight might feel like a particularly brutal game of paintball in Bluebell Wood. But then, the real battles are yet to come...\r\n\r\n\r\nVerdict - Putting formula blockbusters to shame, Fellowship is impeccably cast and constructed with both care and passion: this is a labour of love that never feels laboured. Emotional range and character depth ultimately take us beyond genre limitations, and it deserves to play as wide as a certain Mr. Potter.\r\n\r\n5/5\r\n\r\n- Colin Kennedy, Empire Magazine"},
       {:author=>"gdeveloper",
        :content=>"An epic movie if I ever saw one. Captivating and just plain fun to watch. This movie is, indeed, art."},
       {:author=>"Wuchak",
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
MOVIE RUNS 2 hours 58 minutes and was shot in New Zealand. \r\n\r\nGRADE: B/B- (6.5/10)"},
       {:author=>"LadyGreenEyes",
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
nd the rest of the series, will be viewed many times.  Classics, worth collecting and treasuring."},
       {:author=>"JPV852",
        :content=>
        "Lost count how many times I've seen the \"The Fellowship of the Ring\" but still fantastic after all these years, epic on
every level and just all around entertaining, the 3.5 running time just flies by. Will be watching \"The Two Towers\" either ton
ight or tomorrow followed by \"The Return of the King\". **4.75/5**"},
       {:author=>"Peter McGinn",
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
% percent of movie goers who haven’t seen it, give it a try."},
       {:author=>"r96sk",
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
oned score, of course.\r\n\r\nVery eager to check out the sequels, prequels and, eventually, the upcoming television series."}]

        expect(movie.review(data_3)).to be_an(Array)
        expect(movie.review(data_3)).to eq(expected)
      end 
    end 
  end 
end 