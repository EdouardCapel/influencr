# Initialize by cleaning the DB

puts 'Cleaning database'
Platform.destroy_all
Format.destroy_all
Influencer.destroy_all
Account.destroy_all
Medium.destroy_all
State.destroy_all
User.destroy_all

# Creating the 4 types of platforms
twitter = Platform.create! name: "Twitter", weight: 1.0
blog = Platform.create! name: "Blog", weight: 1.0
newsletter = Platform.create! name: "Newsletter", weight: 1.0
medium = Platform.create! name: "Medium", weight: 1.0
external_blog = Platform.create! name: "External Blog", weight: 1.0
youtube = Platform.create! name:"Conference", weight: 1.0

# Creating the 4 types of formats
tweet = Format.create! type_of: "tweet", weight: 0.25
article = Format.create! type_of: "article", weight: 1.0
podcast = Format.create! type_of: "podcast", weight: 1.0
video = Format.create! type_of: "video", weight: 1.0


# Creating big m hash!
puts 'Creating database'
full_list = [

  # Influencer 1 : Paul Graham

  {
    name: 'Paul Graham',
    bio: "Programmer, writer, and investor. In 1995, he and Robert Morris started Viaweb, the first software as a service company. Viaweb was acquired by Yahoo in 1998, where it became Yahoo Store. In 2001 he started publishing essays on paulgraham.com, which in 2015 got 34 million page views. In 2005 he and Jessica Livingston, Robert Morris, and Trevor Blackwell started Y Combinator, the first of a new type of startup incubator. Since 2005 Y Combinator has funded over 1000 startups, including Dropbox, Airbnb, Stripe, and Reddit.",
    accounts: [
      {
        username: "paulg",
        url:"https://twitter.com/paulg",
        platform: twitter,
        media: [
          {
            url: "https://twitter.com/paulg/status/1100885951033810947",
            content: "Startups don't win by having a cleverer fundraising strategy than their competitors. They win by having a better product. So focus on your product, not on optimizing fundraising.",
            title: nil,
            header: nil,
            format: tweet
          }
        ]
      },
      {
        username: nil,
        url:"http://paulgraham.com/",
        platform: blog,
        media: [
          {
            url: "http://paulgraham.com/ds.html",
            content: "One of the most common types of advice we give at Y Combinator is to do things that don't scale. A lot of would-be founders believe that startups either take off or don't. You build something, make it available, and if you've made a better mousetrap, people beat a path to your door as promised. Or they don't, in which case the market must not exist. [1]

Actually startups take off because the founders make them take off. There may be a handful that just grew by themselves, but usually it takes some sort of push to get them going. A good metaphor would be the cranks that car engines had before they got electric starters. Once the engine was going, it would keep going, but there was a separate and laborious process to get it going.

Recruit

The most common unscalable thing founders have to do at the start is to recruit users manually. Nearly all startups have to. You can't wait for users to come to you. You have to go out and get them.

Stripe is one of the most successful startups we've funded, and the problem they solved was an urgent one. If anyone could have sat back and waited for users, it was Stripe. But in fact they're famous within YC for aggressive early user acquisition.

Startups building things for other startups have a big pool of potential users in the other companies we've funded, and none took better advantage of it than Stripe. At YC we use the term 'Collison installation' for the technique they invented. More diffident founders ask 'Will you try our beta?' and if the answer is yes, they say 'Great, we'll send you a link.' But the Collison brothers weren't going to wait. When anyone agreed to try Stripe they'd say 'Right then, give me your laptop' and set them up on the spot.

There are two reasons founders resist going out and recruiting users individually. One is a combination of shyness and laziness. They'd rather sit at home writing code than go out and talk to a bunch of strangers and probably be rejected by most of them. But for a startup to succeed, at least one founder (usually the CEO) will have to spend a lot of time on sales and marketing. [2]

The other reason founders ignore this path is that the absolute numbers seem so small at first. This can't be how the big, famous startups got started, they think. The mistake they make is to underestimate the power of compound growth. We encourage every startup to measure their progress by weekly growth rate. If you have 100 users, you need to get 10 more next week to grow 10% a week. And while 110 may not seem much better than 100, if you keep growing at 10% a week you'll be surprised how big the numbers get. After a year you'll have 14,000 users, and after 2 years you'll have 2 million.

You'll be doing different things when you're acquiring users a thousand at a time, and growth has to slow down eventually. But if the market exists you can usually start by recruiting users manually and then gradually switch to less manual methods. [3]

Airbnb is a classic example of this technique. Marketplaces are so hard to get rolling that you should expect to take heroic measures at first. In Airbnb's case, these consisted of going door to door in New York, recruiting new users and helping existing ones improve their listings. When I remember the Airbnbs during YC, I picture them with rolly bags, because when they showed up for tuesday dinners they'd always just flown back from somewhere.

Fragile

Airbnb now seems like an unstoppable juggernaut, but early on it was so fragile that about 30 days of going out and engaging in person with users made the difference between success and failure.

That initial fragility was not a unique feature of Airbnb. Almost all startups are fragile initially. And that's one of the biggest things inexperienced founders and investors (and reporters and know-it-alls on forums) get wrong about them. They unconsciously judge larval startups by the standards of established ones. They're like someone looking at a newborn baby and concluding 'there's no way this tiny creature could ever accomplish anything.'

It's harmless if reporters and know-it-alls dismiss your startup. They always get things wrong. It's even ok if investors dismiss your startup; they'll change their minds when they see growth. The big danger is that you'll dismiss your startup yourself. I've seen it happen. I often have to encourage founders who don't see the full potential of what they're building. Even Bill Gates made that mistake. He returned to Harvard for the fall semester after starting Microsoft. He didn't stay long, but he wouldn't have returned at all if he'd realized Microsoft was going to be even a fraction of the size it turned out to be. [4]

The question to ask about an early stage startup is not 'is this company taking over the world?' but 'how big could this company get if the founders did the right things?' And the right things often seem both laborious and inconsequential at the time. Microsoft can't have seemed very impressive when it was just a couple guys in Albuquerque writing Basic interpreters for a market of a few thousand hobbyists (as they were then called), but in retrospect that was the optimal path to dominating microcomputer software. And I know Brian Chesky and Joe Gebbia didn't feel like they were en route to the big time as they were taking 'professional' photos of their first hosts' apartments. They were just trying to survive. But in retrospect that too was the optimal path to dominating a big market.

How do you find users to recruit manually? If you build something to solve your own problems, then you only have to find your peers, which is usually straightforward. Otherwise you'll have to make a more deliberate effort to locate the most promising vein of users. The usual way to do that is to get some initial set of users by doing a comparatively untargeted launch, and then to observe which kind seem most enthusiastic, and seek out more like them. For example, Ben Silbermann noticed that a lot of the earliest Pinterest users were interested in design, so he went to a conference of design bloggers to recruit users, and that worked well. [5]

Delight

You should take extraordinary measures not just to acquire users, but also to make them happy. For as long as they could (which turned out to be surprisingly long), Wufoo sent each new user a hand-written thank you note. Your first users should feel that signing up with you was one of the best choices they ever made. And you in turn should be racking your brains to think of new ways to delight them.

Why do we have to teach startups this? Why is it counterintuitive for founders? Three reasons, I think.

One is that a lot of startup founders are trained as engineers, and customer service is not part of the training of engineers. You're supposed to build things that are robust and elegant, not be slavishly attentive to individual users like some kind of salesperson. Ironically, part of the reason engineering is traditionally averse to handholding is that its traditions date from a time when engineers were less powerful — when they were only in charge of their narrow domain of building things, rather than running the whole show. You can be ornery when you're Scotty, but not when you're Kirk.

Another reason founders don't focus enough on individual customers is that they worry it won't scale. But when founders of larval startups worry about this, I point out that in their current state they have nothing to lose. Maybe if they go out of their way to make existing users super happy, they'll one day have too many to do so much for. That would be a great problem to have. See if you can make it happen. And incidentally, when it does, you'll find that delighting customers scales better than you expected. Partly because you can usually find ways to make anything scale more than you would have predicted, and partly because delighting customers will by then have permeated your culture.

I have never once seen a startup lured down a blind alley by trying too hard to make their initial users happy.

But perhaps the biggest thing preventing founders from realizing how attentive they could be to their users is that they've never experienced such attention themselves. Their standards for customer service have been set by the companies they've been customers of, which are mostly big ones. Tim Cook doesn't send you a hand-written note after you buy a laptop. He can't. But you can. That's one advantage of being small: you can provide a level of service no big company can. [6]

Once you realize that existing conventions are not the upper bound on user experience, it's interesting in a very pleasant way to think about how far you could go to delight your users.

Experience

I was trying to think of a phrase to convey how extreme your attention to users should be, and I realized Steve Jobs had already done it: insanely great. Steve wasn't just using 'insanely' as a synonym for 'very.' He meant it more literally — that one should focus on quality of execution to a degree that in everyday life would be considered pathological.

All the most successful startups we've funded have, and that probably doesn't surprise would-be founders. What novice founders don't get is what insanely great translates to in a larval startup. When Steve Jobs started using that phrase, Apple was already an established company. He meant the Mac (and its documentation and even packaging — such is the nature of obsession) should be insanely well designed and manufactured. That's not hard for engineers to grasp. It's just a more extreme version of designing a robust and elegant product.

What founders have a hard time grasping (and Steve himself might have had a hard time grasping) is what insanely great morphs into as you roll the time slider back to the first couple months of a startup's life. It's not the product that should be insanely great, but the experience of being your user. The product is just one component of that. For a big company it's necessarily the dominant one. But you can and should give users an insanely great experience with an early, incomplete, buggy product, if you make up the difference with attentiveness.

Can, perhaps, but should? Yes. Over-engaging with early users is not just a permissible technique for getting growth rolling. For most successful startups it's a necessary part of the feedback loop that makes the product good. Making a better mousetrap is not an atomic operation. Even if you start the way most successful startups have, by building something you yourself need, the first thing you build is never quite right. And except in domains with big penalties for making mistakes, it's often better not to aim for perfection initially. In software, especially, it usually works best to get something in front of users as soon as it has a quantum of utility, and then see what they do with it. Perfectionism is often an excuse for procrastination, and in any case your initial model of users is always inaccurate, even if you're one of them. [7]

The feedback you get from engaging directly with your earliest users will be the best you ever get. When you're so big you have to resort to focus groups, you'll wish you could go over to your users' homes and offices and watch them use your stuff like you did when there were only a handful of them.

Fire

Sometimes the right unscalable trick is to focus on a deliberately narrow market. It's like keeping a fire contained at first to get it really hot before adding more logs.

That's what Facebook did. At first it was just for Harvard students. In that form it only had a potential market of a few thousand people, but because they felt it was really for them, a critical mass of them signed up. After Facebook stopped being for Harvard students, it remained for students at specific colleges for quite a while. When I interviewed Mark Zuckerberg at Startup School, he said that while it was a lot of work creating course lists for each school, doing that made students feel the site was their natural home.

Any startup that could be described as a marketplace usually has to start in a subset of the market, but this can work for other startups as well. It's always worth asking if there's a subset of the market in which you can get a critical mass of users quickly. [8]

Most startups that use the contained fire strategy do it unconsciously. They build something for themselves and their friends, who happen to be the early adopters, and only realize later that they could offer it to a broader market. The strategy works just as well if you do it unconsciously. The biggest danger of not being consciously aware of this pattern is for those who naively discard part of it. E.g. if you don't build something for yourself and your friends, or even if you do, but you come from the corporate world and your friends are not early adopters, you'll no longer have a perfect initial market handed to you on a platter.

Among companies, the best early adopters are usually other startups. They're more open to new things both by nature and because, having just been started, they haven't made all their choices yet. Plus when they succeed they grow fast, and you with them. It was one of many unforeseen advantages of the YC model (and specifically of making YC big) that B2B startups now have an instant market of hundreds of other startups ready at hand.

Meraki

For hardware startups there's a variant of doing things that don't scale that we call 'pulling a Meraki.' Although we didn't fund Meraki, the founders were Robert Morris's grad students, so we know their history. They got started by doing something that really doesn't scale: assembling their routers themselves.

Hardware startups face an obstacle that software startups don't. The minimum order for a factory production run is usually several hundred thousand dollars. Which can put you in a catch-22: without a product you can't generate the growth you need to raise the money to manufacture your product. Back when hardware startups had to rely on investors for money, you had to be pretty convincing to overcome this. The arrival of crowdfunding (or more precisely, preorders) has helped a lot. But even so I'd advise startups to pull a Meraki initially if they can. That's what Pebble did. The Pebbles assembled the first several hundred watches themselves. If they hadn't gone through that phase, they probably wouldn't have sold $10 million worth of watches when they did go on Kickstarter.

Like paying excessive attention to early customers, fabricating things yourself turns out to be valuable for hardware startups. You can tweak the design faster when you're the factory, and you learn things you'd never have known otherwise. Eric Migicovsky of Pebble said one of things he learned was 'how valuable it was to source good screws.' Who knew?

Consult

Sometimes we advise founders of B2B startups to take over-engagement to an extreme, and to pick a single user and act as if they were consultants building something just for that one user. The initial user serves as the form for your mold; keep tweaking till you fit their needs perfectly, and you'll usually find you've made something other users want too. Even if there aren't many of them, there are probably adjacent territories that have more. As long as you can find just one user who really needs something and can act on that need, you've got a toehold in making something people want, and that's as much as any startup needs initially. [9]

Consulting is the canonical example of work that doesn't scale. But (like other ways of bestowing one's favors liberally) it's safe to do it so long as you're not being paid to. That's where companies cross the line. So long as you're a product company that's merely being extra attentive to a customer, they're very grateful even if you don't solve all their problems. But when they start paying you specifically for that attentiveness — when they start paying you by the hour — they expect you to do everything.

Another consulting-like technique for recruiting initially lukewarm users is to use your software yourselves on their behalf. We did that at Viaweb. When we approached merchants asking if they wanted to use our software to make online stores, some said no, but they'd let us make one for them. Since we would do anything to get users, we did. We felt pretty lame at the time. Instead of organizing big strategic e-commerce partnerships, we were trying to sell luggage and pens and men's shirts. But in retrospect it was exactly the right thing to do, because it taught us how it would feel to merchants to use our software. Sometimes the feedback loop was near instantaneous: in the middle of building some merchant's site I'd find I needed a feature we didn't have, so I'd spend a couple hours implementing it and then resume building the site.

Manual

There's a more extreme variant where you don't just use your software, but are your software. When you only have a small number of users, you can sometimes get away with doing by hand things that you plan to automate later. This lets you launch faster, and when you do finally automate yourself out of the loop, you'll know exactly what to build because you'll have muscle memory from doing it yourself.

When manual components look to the user like software, this technique starts to have aspects of a practical joke. For example, the way Stripe delivered 'instant' merchant accounts to its first users was that the founders manually signed them up for traditional merchant accounts behind the scenes.

Some startups could be entirely manual at first. If you can find someone with a problem that needs solving and you can solve it manually, go ahead and do that for as long as you can, and then gradually automate the bottlenecks. It would be a little frightening to be solving users' problems in a way that wasn't yet automatic, but less frightening than the far more common case of having something automatic that doesn't yet solve anyone's problems.

Big

I should mention one sort of initial tactic that usually doesn't work: the Big Launch. I occasionally meet founders who seem to believe startups are projectiles rather than powered aircraft, and that they'll make it big if and only if they're launched with sufficient initial velocity. They want to launch simultaneously in 8 different publications, with embargoes. And on a tuesday, of course, since they read somewhere that's the optimum day to launch something.

It's easy to see how little launches matter. Think of some successful startups. How many of their launches do you remember? All you need from a launch is some initial core of users. How well you're doing a few months later will depend more on how happy you made those users than how many there were of them. [10]

So why do founders think launches matter? A combination of solipsism and laziness. They think what they're building is so great that everyone who hears about it will immediately sign up. Plus it would be so much less work if you could get users merely by broadcasting your existence, rather than recruiting them one at a time. But even if what you're building really is great, getting users will always be a gradual process — partly because great things are usually also novel, but mainly because users have other things to think about.

Partnerships too usually don't work. They don't work for startups in general, but they especially don't work as a way to get growth started. It's a common mistake among inexperienced founders to believe that a partnership with a big company will be their big break. Six months later they're all saying the same thing: that was way more work than we expected, and we ended up getting practically nothing out of it. [11]

It's not enough just to do something extraordinary initially. You have to make an extraordinary effort initially. Any strategy that omits the effort — whether it's expecting a big launch to get you users, or a big partner — is ipso facto suspect.

Vector

The need to do something unscalably laborious to get started is so nearly universal that it might be a good idea to stop thinking of startup ideas as scalars. Instead we should try thinking of them as pairs of what you're going to build, plus the unscalable thing(s) you're going to do initially to get the company going.

It could be interesting to start viewing startup ideas this way, because now that there are two components you can try to be imaginative about the second as well as the first. But in most cases the second component will be what it usually is — recruit users manually and give them an overwhelmingly good experience — and the main benefit of treating startups as vectors will be to remind founders they need to work hard in two dimensions. [12]

In the best case, both components of the vector contribute to your company's DNA: the unscalable things you have to do to get started are not merely a necessary evil, but change the company permanently for the better. If you have to be aggressive about user acquisition when you're small, you'll probably still be aggressive when you're big. If you have to manufacture your own hardware, or use your software on users's behalf, you'll learn things you couldn't have learned otherwise. And most importantly, if you have to work hard to delight users when you only have a handful of them, you'll keep doing it when you have a lot.

Notes

[1] Actually Emerson never mentioned mousetraps specifically. He wrote 'If a man has good corn or wood, or boards, or pigs, to sell, or can make better chairs or knives, crucibles or church organs, than anybody else, you will find a broad hard-beaten road to his house, though it be in the woods.'

[2] Thanks to Sam Altman for suggesting I make this explicit. And no, you can't avoid doing sales by hiring someone to do it for you. You have to do sales yourself initially. Later you can hire a real salesperson to replace you.

[3] The reason this works is that as you get bigger, your size helps you grow. Patrick Collison wrote 'At some point, there was a very noticeable change in how Stripe felt. It tipped from being this boulder we had to push to being a train car that in fact had its own momentum.'

[4] One of the more subtle ways in which YC can help founders is by calibrating their ambitions, because we know exactly how a lot of successful startups looked when they were just getting started.

[5] If you're building something for which you can't easily get a small set of users to observe — e.g. enterprise software — and in a domain where you have no connections, you'll have to rely on cold calls and introductions. But should you even be working on such an idea?

[6] Garry Tan pointed out an interesting trap founders fall into in the beginning. They want so much to seem big that they imitate even the flaws of big companies, like indifference to individual users. This seems to them more 'professional.' Actually it's better to embrace the fact that you're small and use whatever advantages that brings.

[7] Your user model almost couldn't be perfectly accurate, because users' needs often change in response to what you build for them. Build them a microcomputer, and suddenly they need to run spreadsheets on it, because the arrival of your new microcomputer causes someone to invent the spreadsheet.

[8] If you have to choose between the subset that will sign up quickest and those that will pay the most, it's usually best to pick the former, because those are probably the early adopters. They'll have a better influence on your product, and they won't make you expend as much effort on sales. And though they have less money, you don't need that much to maintain your target growth rate early on.

[9] Yes, I can imagine cases where you could end up making something that was really only useful for one user. But those are usually obvious, even to inexperienced founders. So if it's not obvious you'd be making something for a market of one, don't worry about that danger.

[10] There may even be an inverse correlation between launch magnitude and success. The only launches I remember are famous flops like the Segway and Google Wave. Wave is a particularly alarming example, because I think it was actually a great idea that was killed partly by its overdone launch.

[11] Google grew big on the back of Yahoo, but that wasn't a partnership. Yahoo was their customer.

[12] It will also remind founders that an idea where the second component is empty — an idea where there is nothing you can do to get going, e.g. because you have no way to find users to recruit manually — is probably a bad idea, at least for those founders.

Thanks to Sam Altman, Paul Buchheit, Patrick Collison, Kevin Hale, Steven Levy, Jessica Livingston, Geoff Ralston, and Garry Tan for reading drafts of this.",
            title: "Do Things That Don't Scale",
            header: "One of the most common types of advice we give at Y Combinator is to do things that don't scale. A lot of would-be founders believe that startups either take off or don't. You build something, make it available, and if you've made a better mousetrap, people beat a path to your door as promised. Or they don't, in which case the market must not exist.",
            format: article
          },
          {
            url: "http://paulgraham.com/start.html",
            content: "You need three things to create a successful startup: to start with good people, to make something customers actually want, and to spend as little money as possible. Most startups that fail do it because they fail at one of these. A startup that does all three will probably succeed.

And that's kind of exciting, when you think about it, because all three are doable. Hard, but doable. And since a startup that succeeds ordinarily makes its founders rich, that implies getting rich is doable too. Hard, but doable.

If there is one message I'd like to get across about startups, that's it. There is no magically difficult step that requires brilliance to solve.

The Idea

In particular, you don't need a brilliant idea to start a startup around. The way a startup makes money is to offer people better technology than they have now. But what people have now is often so bad that it doesn't take brilliance to do better.

Google's plan, for example, was simply to create a search site that didn't suck. They had three new ideas: index more of the Web, use links to rank search results, and have clean, simple web pages with unintrusive keyword-based ads. Above all, they were determined to make a site that was good to use. No doubt there are great technical tricks within Google, but the overall plan was straightforward. And while they probably have bigger ambitions now, this alone brings them a billion dollars a year. [1]

There are plenty of other areas that are just as backward as search was before Google. I can think of several heuristics for generating ideas for startups, but most reduce to this: look at something people are trying to do, and figure out how to do it in a way that doesn't suck.

For example, dating sites currently suck far worse than search did before Google. They all use the same simple-minded model. They seem to have approached the problem by thinking about how to do database matches instead of how dating works in the real world. An undergrad could build something better as a class project. And yet there's a lot of money at stake. Online dating is a valuable business now, and it might be worth a hundred times as much if it worked.

An idea for a startup, however, is only a beginning. A lot of would-be startup founders think the key to the whole process is the initial idea, and from that point all you have to do is execute. Venture capitalists know better. If you go to VC firms with a brilliant idea that you'll tell them about if they sign a nondisclosure agreement, most will tell you to get lost. That shows how much a mere idea is worth. The market price is less than the inconvenience of signing an NDA.

Another sign of how little the initial idea is worth is the number of startups that change their plan en route. Microsoft's original plan was to make money selling programming languages, of all things. Their current business model didn't occur to them until IBM dropped it in their lap five years later.

Ideas for startups are worth something, certainly, but the trouble is, they're not transferrable. They're not something you could hand to someone else to execute. Their value is mainly as starting points: as questions for the people who had them to continue thinking about.

What matters is not ideas, but the people who have them. Good people can fix bad ideas, but good ideas can't save bad people.

People

What do I mean by good people? One of the best tricks I learned during our startup was a rule for deciding who to hire. Could you describe the person as an animal? It might be hard to translate that into another language, but I think everyone in the US knows what it means. It means someone who takes their work a little too seriously; someone who does what they do so well that they pass right through professional and cross over into obsessive.

What it means specifically depends on the job: a salesperson who just won't take no for an answer; a hacker who will stay up till 4:00 AM rather than go to bed leaving code with a bug in it; a PR person who will cold-call New York Times reporters on their cell phones; a graphic designer who feels physical pain when something is two millimeters out of place.

Almost everyone who worked for us was an animal at what they did. The woman in charge of sales was so tenacious that I used to feel sorry for potential customers on the phone with her. You could sense them squirming on the hook, but you knew there would be no rest for them till they'd signed up.

If you think about people you know, you'll find the animal test is easy to apply. Call the person's image to mind and imagine the sentence 'so-and-so is an animal.' If you laugh, they're not. You don't need or perhaps even want this quality in big companies, but you need it in a startup.

For programmers we had three additional tests. Was the person genuinely smart? If so, could they actually get things done? And finally, since a few good hackers have unbearable personalities, could we stand to have them around?

That last test filters out surprisingly few people. We could bear any amount of nerdiness if someone was truly smart. What we couldn't stand were people with a lot of attitude. But most of those weren't truly smart, so our third test was largely a restatement of the first.

When nerds are unbearable it's usually because they're trying too hard to seem smart. But the smarter they are, the less pressure they feel to act smart. So as a rule you can recognize genuinely smart people by their ability to say things like 'I don't know,' 'Maybe you're right,' and 'I don't understand x well enough.'

This technique doesn't always work, because people can be influenced by their environment. In the MIT CS department, there seems to be a tradition of acting like a brusque know-it-all. I'm told it derives ultimately from Marvin Minsky, in the same way the classic airline pilot manner is said to derive from Chuck Yeager. Even genuinely smart people start to act this way there, so you have to make allowances.

It helped us to have Robert Morris, who is one of the readiest to say 'I don't know' of anyone I've met. (At least, he was before he became a professor at MIT.) No one dared put on attitude around Robert, because he was obviously smarter than they were and yet had zero attitude himself.

Like most startups, ours began with a group of friends, and it was through personal contacts that we got most of the people we hired. This is a crucial difference between startups and big companies. Being friends with someone for even a couple days will tell you more than companies could ever learn in interviews. [2]

It's no coincidence that startups start around universities, because that's where smart people meet. It's not what people learn in classes at MIT and Stanford that has made technology companies spring up around them. They could sing campfire songs in the classes so long as admissions worked the same.

If you start a startup, there's a good chance it will be with people you know from college or grad school. So in theory you ought to try to make friends with as many smart people as you can in school, right? Well, no. Don't make a conscious effort to schmooze; that doesn't work well with hackers.

What you should do in college is work on your own projects. Hackers should do this even if they don't plan to start startups, because it's the only real way to learn how to program. In some cases you may collaborate with other students, and this is the best way to get to know good hackers. The project may even grow into a startup. But once again, I wouldn't aim too directly at either target. Don't force things; just work on stuff you like with people you like.

Ideally you want between two and four founders. It would be hard to start with just one. One person would find the moral weight of starting a company hard to bear. Even Bill Gates, who seems to be able to bear a good deal of moral weight, had to have a co-founder. But you don't want so many founders that the company starts to look like a group photo. Partly because you don't need a lot of people at first, but mainly because the more founders you have, the worse disagreements you'll have. When there are just two or three founders, you know you have to resolve disputes immediately or perish. If there are seven or eight, disagreements can linger and harden into factions. You don't want mere voting; you need unanimity.

In a technology startup, which most startups are, the founders should include technical people. During the Internet Bubble there were a number of startups founded by business people who then went looking for hackers to create their product for them. This doesn't work well. Business people are bad at deciding what to do with technology, because they don't know what the options are, or which kinds of problems are hard and which are easy. And when business people try to hire hackers, they can't tell which ones are good. Even other hackers have a hard time doing that. For business people it's roulette.

Do the founders of a startup have to include business people? That depends. We thought so when we started ours, and we asked several people who were said to know about this mysterious thing called 'business' if they would be the president. But they all said no, so I had to do it myself. And what I discovered was that business was no great mystery. It's not something like physics or medicine that requires extensive study. You just try to get people to pay you for stuff.

I think the reason I made such a mystery of business was that I was disgusted by the idea of doing it. I wanted to work in the pure, intellectual world of software, not deal with customers' mundane problems. People who don't want to get dragged into some kind of work often develop a protective incompetence at it. Paul Erdos was particularly good at this. By seeming unable even to cut a grapefruit in half (let alone go to the store and buy one), he forced other people to do such things for him, leaving all his time free for math. Erdos was an extreme case, but most husbands use the same trick to some degree.

Once I was forced to discard my protective incompetence, I found that business was neither so hard nor so boring as I feared. There are esoteric areas of business that are quite hard, like tax law or the pricing of derivatives, but you don't need to know about those in a startup. All you need to know about business to run a startup are commonsense things people knew before there were business schools, or even universities.

If you work your way down the Forbes 400 making an x next to the name of each person with an MBA, you'll learn something important about business school. After Warren Buffett, you don't hit another MBA till number 22, Phil Knight, the CEO of Nike. There are only 5 MBAs in the top 50. What you notice in the Forbes 400 are a lot of people with technical backgrounds. Bill Gates, Steve Jobs, Larry Ellison, Michael Dell, Jeff Bezos, Gordon Moore. The rulers of the technology business tend to come from technology, not business. So if you want to invest two years in something that will help you succeed in business, the evidence suggests you'd do better to learn how to hack than get an MBA. [3]

There is one reason you might want to include business people in a startup, though: because you have to have at least one person willing and able to focus on what customers want. Some believe only business people can do this-- that hackers can implement software, but not design it. That's nonsense. There's nothing about knowing how to program that prevents hackers from understanding users, or about not knowing how to program that magically enables business people to understand them.

If you can't understand users, however, you should either learn how or find a co-founder who can. That is the single most important issue for technology startups, and the rock that sinks more of them than anything else.

What Customers Want

It's not just startups that have to worry about this. I think most businesses that fail do it because they don't give customers what they want. Look at restaurants. A large percentage fail, about a quarter in the first year. But can you think of one restaurant that had really good food and went out of business?

Restaurants with great food seem to prosper no matter what. A restaurant with great food can be expensive, crowded, noisy, dingy, out of the way, and even have bad service, and people will keep coming. It's true that a restaurant with mediocre food can sometimes attract customers through gimmicks. But that approach is very risky. It's more straightforward just to make the food good.

It's the same with technology. You hear all kinds of reasons why startups fail. But can you think of one that had a massively popular product and still failed?

In nearly every failed startup, the real problem was that customers didn't want the product. For most, the cause of death is listed as 'ran out of funding,' but that's only the immediate cause. Why couldn't they get more funding? Probably because the product was a dog, or never seemed likely to be done, or both.

When I was trying to think of the things every startup needed to do, I almost included a fourth: get a version 1 out as soon as you can. But I decided not to, because that's implicit in making something customers want. The only way to make something customers want is to get a prototype in front of them and refine it based on their reactions.

The other approach is what I call the 'Hail Mary' strategy. You make elaborate plans for a product, hire a team of engineers to develop it (people who do this tend to use the term 'engineer' for hackers), and then find after a year that you've spent two million dollars to develop something no one wants. This was not uncommon during the Bubble, especially in companies run by business types, who thought of software development as something terrifying that therefore had to be carefully planned.

We never even considered that approach. As a Lisp hacker, I come from the tradition of rapid prototyping. I would not claim (at least, not here) that this is the right way to write every program, but it's certainly the right way to write software for a startup. In a startup, your initial plans are almost certain to be wrong in some way, and your first priority should be to figure out where. The only way to do that is to try implementing them.

Like most startups, we changed our plan on the fly. At first we expected our customers to be Web consultants. But it turned out they didn't like us, because our software was easy to use and we hosted the site. It would be too easy for clients to fire them. We also thought we'd be able to sign up a lot of catalog companies, because selling online was a natural extension of their existing business. But in 1996 that was a hard sell. The middle managers we talked to at catalog companies saw the Web not as an opportunity, but as something that meant more work for them.

We did get a few of the more adventurous catalog companies. Among them was Frederick's of Hollywood, which gave us valuable experience dealing with heavy loads on our servers. But most of our users were small, individual merchants who saw the Web as an opportunity to build a business. Some had retail stores, but many only existed online. And so we changed direction to focus on these users. Instead of concentrating on the features Web consultants and catalog companies would want, we worked to make the software easy to use.

I learned something valuable from that. It's worth trying very, very hard to make technology easy to use. Hackers are so used to computers that they have no idea how horrifying software seems to normal people. Stephen Hawking's editor told him that every equation he included in his book would cut sales in half. When you work on making technology easier to use, you're riding that curve up instead of down. A 10% improvement in ease of use doesn't just increase your sales 10%. It's more likely to double your sales.

How do you figure out what customers want? Watch them. One of the best places to do this was at trade shows. Trade shows didn't pay as a way of getting new customers, but they were worth it as market research. We didn't just give canned presentations at trade shows. We used to show people how to build real, working stores. Which meant we got to watch as they used our software, and talk to them about what they needed.

No matter what kind of startup you start, it will probably be a stretch for you, the founders, to understand what users want. The only kind of software you can build without studying users is the sort for which you are the typical user. But this is just the kind that tends to be open source: operating systems, programming languages, editors, and so on. So if you're developing technology for money, you're probably not going to be developing it for people like you. Indeed, you can use this as a way to generate ideas for startups: what do people who are not like you want from technology?

When most people think of startups, they think of companies like Apple or Google. Everyone knows these, because they're big consumer brands. But for every startup like that, there are twenty more that operate in niche markets or live quietly down in the infrastructure. So if you start a successful startup, odds are you'll start one of those.

Another way to say that is, if you try to start the kind of startup that has to be a big consumer brand, the odds against succeeding are steeper. The best odds are in niche markets. Since startups make money by offering people something better than they had before, the best opportunities are where things suck most. And it would be hard to find a place where things suck more than in corporate IT departments. You would not believe the amount of money companies spend on software, and the crap they get in return. This imbalance equals opportunity.

If you want ideas for startups, one of the most valuable things you could do is find a middle-sized non-technology company and spend a couple weeks just watching what they do with computers. Most good hackers have no more idea of the horrors perpetrated in these places than rich Americans do of what goes on in Brazilian slums.

Start by writing software for smaller companies, because it's easier to sell to them. It's worth so much to sell stuff to big companies that the people selling them the crap they currently use spend a lot of time and money to do it. And while you can outhack Oracle with one frontal lobe tied behind your back, you can't outsell an Oracle salesman. So if you want to win through better technology, aim at smaller customers. [4]

They're the more strategically valuable part of the market anyway. In technology, the low end always eats the high end. It's easier to make an inexpensive product more powerful than to make a powerful product cheaper. So the products that start as cheap, simple options tend to gradually grow more powerful till, like water rising in a room, they squash the 'high-end' products against the ceiling. Sun did this to mainframes, and Intel is doing it to Sun. Microsoft Word did it to desktop publishing software like Interleaf and Framemaker. Mass-market digital cameras are doing it to the expensive models made for professionals. Avid did it to the manufacturers of specialized video editing systems, and now Apple is doing it to Avid. Henry Ford did it to the car makers that preceded him. If you build the simple, inexpensive option, you'll not only find it easier to sell at first, but you'll also be in the best position to conquer the rest of the market.

It's very dangerous to let anyone fly under you. If you have the cheapest, easiest product, you'll own the low end. And if you don't, you're in the crosshairs of whoever does.

Raising Money

To make all this happen, you're going to need money. Some startups have been self-funding-- Microsoft for example-- but most aren't. I think it's wise to take money from investors. To be self-funding, you have to start as a consulting company, and it's hard to switch from that to a product company.

Financially, a startup is like a pass/fail course. The way to get rich from a startup is to maximize the company's chances of succeeding, not to maximize the amount of stock you retain. So if you can trade stock for something that improves your odds, it's probably a smart move.

To most hackers, getting investors seems like a terrifying and mysterious process. Actually it's merely tedious. I'll try to give an outline of how it works.

The first thing you'll need is a few tens of thousands of dollars to pay your expenses while you develop a prototype. This is called seed capital. Because so little money is involved, raising seed capital is comparatively easy-- at least in the sense of getting a quick yes or no.

Usually you get seed money from individual rich people called 'angels.' Often they're people who themselves got rich from technology. At the seed stage, investors don't expect you to have an elaborate business plan. Most know that they're supposed to decide quickly. It's not unusual to get a check within a week based on a half-page agreement.

We started Viaweb with $10,000 of seed money from our friend Julian. But he gave us a lot more than money. He's a former CEO and also a corporate lawyer, so he gave us a lot of valuable advice about business, and also did all the legal work of getting us set up as a company. Plus he introduced us to one of the two angel investors who supplied our next round of funding.

Some angels, especially those with technology backgrounds, may be satisfied with a demo and a verbal description of what you plan to do. But many will want a copy of your business plan, if only to remind themselves what they invested in.

Our angels asked for one, and looking back, I'm amazed how much worry it caused me. 'Business plan' has that word 'business' in it, so I figured it had to be something I'd have to read a book about business plans to write. Well, it doesn't. At this stage, all most investors expect is a brief description of what you plan to do and how you're going to make money from it, and the resumes of the founders. If you just sit down and write out what you've been saying to one another, that should be fine. It shouldn't take more than a couple hours, and you'll probably find that writing it all down gives you more ideas about what to do.

For the angel to have someone to make the check out to, you're going to have to have some kind of company. Merely incorporating yourselves isn't hard. The problem is, for the company to exist, you have to decide who the founders are, and how much stock they each have. If there are two founders with the same qualifications who are both equally committed to the business, that's easy. But if you have a number of people who are expected to contribute in varying degrees, arranging the proportions of stock can be hard. And once you've done it, it tends to be set in stone.

I have no tricks for dealing with this problem. All I can say is, try hard to do it right. I do have a rule of thumb for recognizing when you have, though. When everyone feels they're getting a slightly bad deal, that they're doing more than they should for the amount of stock they have, the stock is optimally apportioned.

There is more to setting up a company than incorporating it, of course: insurance, business license, unemployment compensation, various things with the IRS. I'm not even sure what the list is, because we, ah, skipped all that. When we got real funding near the end of 1996, we hired a great CFO, who fixed everything retroactively. It turns out that no one comes and arrests you if you don't do everything you're supposed to when starting a company. And a good thing too, or a lot of startups would never get started. [5]

It can be dangerous to delay turning yourself into a company, because one or more of the founders might decide to split off and start another company doing the same thing. This does happen. So when you set up the company, as well as as apportioning the stock, you should get all the founders to sign something agreeing that everyone's ideas belong to this company, and that this company is going to be everyone's only job.

[If this were a movie, ominous music would begin here.]

While you're at it, you should ask what else they've signed. One of the worst things that can happen to a startup is to run into intellectual property problems. We did, and it came closer to killing us than any competitor ever did.

As we were in the middle of getting bought, we discovered that one of our people had, early on, been bound by an agreement that said all his ideas belonged to the giant company that was paying for him to go to grad school. In theory, that could have meant someone else owned big chunks of our software. So the acquisition came to a screeching halt while we tried to sort this out. The problem was, since we'd been about to be acquired, we'd allowed ourselves to run low on cash. Now we needed to raise more to keep going. But it's hard to raise money with an IP cloud over your head, because investors can't judge how serious it is.

Our existing investors, knowing that we needed money and had nowhere else to get it, at this point attempted certain gambits which I will not describe in detail, except to remind readers that the word 'angel' is a metaphor. The founders thereupon proposed to walk away from the company, after giving the investors a brief tutorial on how to administer the servers themselves. And while this was happening, the acquirers used the delay as an excuse to welch on the deal.

Miraculously it all turned out ok. The investors backed down; we did another round of funding at a reasonable valuation; the giant company finally gave us a piece of paper saying they didn't own our software; and six months later we were bought by Yahoo for much more than the earlier acquirer had agreed to pay. So we were happy in the end, though the experience probably took several years off my life.

Don't do what we did. Before you consummate a startup, ask everyone about their previous IP history.

Once you've got a company set up, it may seem presumptuous to go knocking on the doors of rich people and asking them to invest tens of thousands of dollars in something that is really just a bunch of guys with some ideas. But when you look at it from the rich people's point of view, the picture is more encouraging. Most rich people are looking for good investments. If you really think you have a chance of succeeding, you're doing them a favor by letting them invest. Mixed with any annoyance they might feel about being approached will be the thought: are these guys the next Google?

Usually angels are financially equivalent to founders. They get the same kind of stock and get diluted the same amount in future rounds. How much stock should they get? That depends on how ambitious you feel. When you offer x percent of your company for y dollars, you're implicitly claiming a certain value for the whole company. Venture investments are usually described in terms of that number. If you give an investor new shares equal to 5% of those already outstanding in return for $100,000, then you've done the deal at a pre-money valuation of $2 million.

How do you decide what the value of the company should be? There is no rational way. At this stage the company is just a bet. I didn't realize that when we were raising money. Julian thought we ought to value the company at several million dollars. I thought it was preposterous to claim that a couple thousand lines of code, which was all we had at the time, were worth several million dollars. Eventually we settled on one millon, because Julian said no one would invest in a company with a valuation any lower. [6]

What I didn't grasp at the time was that the valuation wasn't just the value of the code we'd written so far. It was also the value of our ideas, which turned out to be right, and of all the future work we'd do, which turned out to be a lot.

The next round of funding is the one in which you might deal with actual venture capital firms. But don't wait till you've burned through your last round of funding to start approaching them. VCs are slow to make up their minds. They can take months. You don't want to be running out of money while you're trying to negotiate with them.

Getting money from an actual VC firm is a bigger deal than getting money from angels. The amounts of money involved are larger, millions usually. So the deals take longer, dilute you more, and impose more onerous conditions.

Sometimes the VCs want to install a new CEO of their own choosing. Usually the claim is that you need someone mature and experienced, with a business background. Maybe in some cases this is true. And yet Bill Gates was young and inexperienced and had no business background, and he seems to have done ok. Steve Jobs got booted out of his own company by someone mature and experienced, with a business background, who then proceeded to ruin the company. So I think people who are mature and experienced, with a business background, may be overrated. We used to call these guys 'newscasters,' because they had neat hair and spoke in deep, confident voices, and generally didn't know much more than they read on the teleprompter.

We talked to a number of VCs, but eventually we ended up financing our startup entirely with angel money. The main reason was that we feared a brand-name VC firm would stick us with a newscaster as part of the deal. That might have been ok if he was content to limit himself to talking to the press, but what if he wanted to have a say in running the company? That would have led to disaster, because our software was so complex. We were a company whose whole m.o. was to win through better technology. The strategic decisions were mostly decisions about technology, and we didn't need any help with those.

This was also one reason we didn't go public. Back in 1998 our CFO tried to talk me into it. In those days you could go public as a dogfood portal, so as a company with a real product and real revenues, we might have done well. But I feared it would have meant taking on a newscaster-- someone who, as they say, 'can talk Wall Street's language.'

I'm happy to see Google is bucking that trend. They didn't talk Wall Street's language when they did their IPO, and Wall Street didn't buy. And now Wall Street is collectively kicking itself. They'll pay attention next time. Wall Street learns new languages fast when money is involved.

You have more leverage negotiating with VCs than you realize. The reason is other VCs. I know a number of VCs now, and when you talk to them you realize that it's a seller's market. Even now there is too much money chasing too few good deals.

VCs form a pyramid. At the top are famous ones like Sequoia and Kleiner Perkins, but beneath those are a huge number you've never heard of. What they all have in common is that a dollar from them is worth one dollar. Most VCs will tell you that they don't just provide money, but connections and advice. If you're talking to Vinod Khosla or John Doerr or Mike Moritz, this is true. But such advice and connections can come very expensive. And as you go down the food chain the VCs get rapidly dumber. A few steps down from the top you're basically talking to bankers who've picked up a few new vocabulary words from reading Wired. (Does your product use XML?) So I'd advise you to be skeptical about claims of experience and connections. Basically, a VC is a source of money. I'd be inclined to go with whoever offered the most money the soonest with the least strings attached.

You may wonder how much to tell VCs. And you should, because some of them may one day be funding your competitors. I think the best plan is not to be overtly secretive, but not to tell them everything either. After all, as most VCs say, they're more interested in the people than the ideas. The main reason they want to talk about your idea is to judge you, not the idea. So as long as you seem like you know what you're doing, you can probably keep a few things back from them. [7]

Talk to as many VCs as you can, even if you don't want their money, because a) they may be on the board of someone who will buy you, and b) if you seem impressive, they'll be discouraged from investing in your competitors. The most efficient way to reach VCs, especially if you only want them to know about you and don't want their money, is at the conferences that are occasionally organized for startups to present to them.

Not Spending It

When and if you get an infusion of real money from investors, what should you do with it? Not spend it, that's what. In nearly every startup that fails, the proximate cause is running out of money. Usually there is something deeper wrong. But even a proximate cause of death is worth trying hard to avoid.

During the Bubble many startups tried to 'get big fast.' Ideally this meant getting a lot of customers fast. But it was easy for the meaning to slide over into hiring a lot of people fast.

Of the two versions, the one where you get a lot of customers fast is of course preferable. But even that may be overrated. The idea is to get there first and get all the users, leaving none for competitors. But I think in most businesses the advantages of being first to market are not so overwhelmingly great. Google is again a case in point. When they appeared it seemed as if search was a mature market, dominated by big players who'd spent millions to build their brands: Yahoo, Lycos, Excite, Infoseek, Altavista, Inktomi. Surely 1998 was a little late to arrive at the party.

But as the founders of Google knew, brand is worth next to nothing in the search business. You can come along at any point and make something better, and users will gradually seep over to you. As if to emphasize the point, Google never did any advertising. They're like dealers; they sell the stuff, but they know better than to use it themselves.

The competitors Google buried would have done better to spend those millions improving their software. Future startups should learn from that mistake. Unless you're in a market where products are as undifferentiated as cigarettes or vodka or laundry detergent, spending a lot on brand advertising is a sign of breakage. And few if any Web businesses are so undifferentiated. The dating sites are running big ad campaigns right now, which is all the more evidence they're ripe for the picking. (Fee, fie, fo, fum, I smell a company run by marketing guys.)

We were compelled by circumstances to grow slowly, and in retrospect it was a good thing. The founders all learned to do every job in the company. As well as writing software, I had to do sales and customer support. At sales I was not very good. I was persistent, but I didn't have the smoothness of a good salesman. My message to potential customers was: you'd be stupid not to sell online, and if you sell online you'd be stupid to use anyone else's software. Both statements were true, but that's not the way to convince people.

I was great at customer support though. Imagine talking to a customer support person who not only knew everything about the product, but would apologize abjectly if there was a bug, and then fix it immediately, while you were on the phone with them. Customers loved us. And we loved them, because when you're growing slow by word of mouth, your first batch of users are the ones who were smart enough to find you by themselves. There is nothing more valuable, in the early stages of a startup, than smart users. If you listen to them, they'll tell you exactly how to make a winning product. And not only will they give you this advice for free, they'll pay you.

We officially launched in early 1996. By the end of that year we had about 70 users. Since this was the era of 'get big fast,' I worried about how small and obscure we were. But in fact we were doing exactly the right thing. Once you get big (in users or employees) it gets hard to change your product. That year was effectively a laboratory for improving our software. By the end of it, we were so far ahead of our competitors that they never had a hope of catching up. And since all the hackers had spent many hours talking to users, we understood online commerce way better than anyone else.

That's the key to success as a startup. There is nothing more important than understanding your business. You might think that anyone in a business must, ex officio, understand it. Far from it. Google's secret weapon was simply that they understood search. I was working for Yahoo when Google appeared, and Yahoo didn't understand search. I know because I once tried to convince the powers that be that we had to make search better, and I got in reply what was then the party line about it: that Yahoo was no longer a mere 'search engine.' Search was now only a small percentage of our page views, less than one month's growth, and now that we were established as a 'media company,' or 'portal,' or whatever we were, search could safely be allowed to wither and drop off, like an umbilical cord.

Well, a small fraction of page views they may be, but they are an important fraction, because they are the page views that Web sessions start with. I think Yahoo gets that now.

Google understands a few other things most Web companies still don't. The most important is that you should put users before advertisers, even though the advertisers are paying and users aren't. One of my favorite bumper stickers reads 'if the people lead, the leaders will follow.' Paraphrased for the Web, this becomes 'get all the users, and the advertisers will follow.' More generally, design your product to please users first, and then think about how to make money from it. If you don't put users first, you leave a gap for competitors who do.

To make something users love, you have to understand them. And the bigger you are, the harder that is. So I say 'get big slow.' The slower you burn through your funding, the more time you have to learn.

The other reason to spend money slowly is to encourage a culture of cheapness. That's something Yahoo did understand. David Filo's title was 'Chief Yahoo,' but he was proud that his unofficial title was 'Cheap Yahoo.' Soon after we arrived at Yahoo, we got an email from Filo, who had been crawling around our directory hierarchy, asking if it was really necessary to store so much of our data on expensive RAID drives. I was impressed by that. Yahoo's market cap then was already in the billions, and they were still worrying about wasting a few gigs of disk space.

When you get a couple million dollars from a VC firm, you tend to feel rich. It's important to realize you're not. A rich company is one with large revenues. This money isn't revenue. It's money investors have given you in the hope you'll be able to generate revenues. So despite those millions in the bank, you're still poor.

For most startups the model should be grad student, not law firm. Aim for cool and cheap, not expensive and impressive. For us the test of whether a startup understood this was whether they had Aeron chairs. The Aeron came out during the Bubble and was very popular with startups. Especially the type, all too common then, that was like a bunch of kids playing house with money supplied by VCs. We had office chairs so cheap that the arms all fell off. This was slightly embarrassing at the time, but in retrospect the grad-studenty atmosphere of our office was another of those things we did right without knowing it.

Our offices were in a wooden triple-decker in Harvard Square. It had been an apartment until about the 1970s, and there was still a claw-footed bathtub in the bathroom. It must once have been inhabited by someone fairly eccentric, because a lot of the chinks in the walls were stuffed with aluminum foil, as if to protect against cosmic rays. When eminent visitors came to see us, we were a bit sheepish about the low production values. But in fact that place was the perfect space for a startup. We felt like our role was to be impudent underdogs instead of corporate stuffed shirts, and that is exactly the spirit you want.

An apartment is also the right kind of place for developing software. Cube farms suck for that, as you've probably discovered if you've tried it. Ever notice how much easier it is to hack at home than at work? So why not make work more like home?

When you're looking for space for a startup, don't feel that it has to look professional. Professional means doing good work, not elevators and glass walls. I'd advise most startups to avoid corporate space at first and just rent an apartment. You want to live at the office in a startup, so why not have a place designed to be lived in as your office?

Besides being cheaper and better to work in, apartments tend to be in better locations than office buildings. And for a startup location is very important. The key to productivity is for people to come back to work after dinner. Those hours after the phone stops ringing are by far the best for getting work done. Great things happen when a group of employees go out to dinner together, talk over ideas, and then come back to their offices to implement them. So you want to be in a place where there are a lot of restaurants around, not some dreary office park that's a wasteland after 6:00 PM. Once a company shifts over into the model where everyone drives home to the suburbs for dinner, however late, you've lost something extraordinarily valuable. God help you if you actually start in that mode.

If I were going to start a startup today, there are only three places I'd consider doing it: on the Red Line near Central, Harvard, or Davis Squares (Kendall is too sterile); in Palo Alto on University or California Aves; and in Berkeley immediately north or south of campus. These are the only places I know that have the right kind of vibe.

The most important way to not spend money is by not hiring people. I may be an extremist, but I think hiring people is the worst thing a company can do. To start with, people are a recurring expense, which is the worst kind. They also tend to cause you to grow out of your space, and perhaps even move to the sort of uncool office building that will make your software worse. But worst of all, they slow you down: instead of sticking your head in someone's office and checking out an idea with them, eight people have to have a meeting about it. So the fewer people you can hire, the better.

During the Bubble a lot of startups had the opposite policy. They wanted to get 'staffed up' as soon as possible, as if you couldn't get anything done unless there was someone with the corresponding job title. That's big company thinking. Don't hire people to fill the gaps in some a priori org chart. The only reason to hire someone is to do something you'd like to do but can't.

If hiring unnecessary people is expensive and slows you down, why do nearly all companies do it? I think the main reason is that people like the idea of having a lot of people working for them. This weakness often extends right up to the CEO. If you ever end up running a company, you'll find the most common question people ask is how many employees you have. This is their way of weighing you. It's not just random people who ask this; even reporters do. And they're going to be a lot more impressed if the answer is a thousand than if it's ten.

This is ridiculous, really. If two companies have the same revenues, it's the one with fewer employees that's more impressive. When people used to ask me how many people our startup had, and I answered 'twenty,' I could see them thinking that we didn't count for much. I used to want to add 'but our main competitor, whose ass we regularly kick, has a hundred and forty, so can we have credit for the larger of the two numbers?'

As with office space, the number of your employees is a choice between seeming impressive, and being impressive. Any of you who were nerds in high school know about this choice. Keep doing it when you start a company.

Should You?

But should you start a company? Are you the right sort of person to do it? If you are, is it worth it?

More people are the right sort of person to start a startup than realize it. That's the main reason I wrote this. There could be ten times more startups than there are, and that would probably be a good thing.

I was, I now realize, exactly the right sort of person to start a startup. But the idea terrified me at first. I was forced into it because I was a Lisp hacker. The company I'd been consulting for seemed to be running into trouble, and there were not a lot of other companies using Lisp. Since I couldn't bear the thought of programming in another language (this was 1995, remember, when 'another language' meant C++) the only option seemed to be to start a new company using Lisp.

I realize this sounds far-fetched, but if you're a Lisp hacker you'll know what I mean. And if the idea of starting a startup frightened me so much that I only did it out of necessity, there must be a lot of people who would be good at it but who are too intimidated to try.

So who should start a startup? Someone who is a good hacker, between about 23 and 38, and who wants to solve the money problem in one shot instead of getting paid gradually over a conventional working life.

I can't say precisely what a good hacker is. At a first rate university this might include the top half of computer science majors. Though of course you don't have to be a CS major to be a hacker; I was a philosophy major in college.

It's hard to tell whether you're a good hacker, especially when you're young. Fortunately the process of starting startups tends to select them automatically. What drives people to start startups is (or should be) looking at existing technology and thinking, don't these guys realize they should be doing x, y, and z? And that's also a sign that one is a good hacker.

I put the lower bound at 23 not because there's something that doesn't happen to your brain till then, but because you need to see what it's like in an existing business before you try running your own. The business doesn't have to be a startup. I spent a year working for a software company to pay off my college loans. It was the worst year of my adult life, but I learned, without realizing it at the time, a lot of valuable lessons about the software business. In this case they were mostly negative lessons: don't have a lot of meetings; don't have chunks of code that multiple people own; don't have a sales guy running the company; don't make a high-end product; don't let your code get too big; don't leave finding bugs to QA people; don't go too long between releases; don't isolate developers from users; don't move from Cambridge to Route 128; and so on. [8] But negative lessons are just as valuable as positive ones. Perhaps even more valuable: it's hard to repeat a brilliant performance, but it's straightforward to avoid errors. [9]

The other reason it's hard to start a company before 23 is that people won't take you seriously. VCs won't trust you, and will try to reduce you to a mascot as a condition of funding. Customers will worry you're going to flake out and leave them stranded. Even you yourself, unless you're very unusual, will feel your age to some degree; you'll find it awkward to be the boss of someone much older than you, and if you're 21, hiring only people younger rather limits your options.

Some people could probably start a company at 18 if they wanted to. Bill Gates was 19 when he and Paul Allen started Microsoft. (Paul Allen was 22, though, and that probably made a difference.) So if you're thinking, I don't care what he says, I'm going to start a company now, you may be the sort of person who could get away with it.

The other cutoff, 38, has a lot more play in it. One reason I put it there is that I don't think many people have the physical stamina much past that age. I used to work till 2:00 or 3:00 AM every night, seven days a week. I don't know if I could do that now.

Also, startups are a big risk financially. If you try something that blows up and leaves you broke at 26, big deal; a lot of 26 year olds are broke. By 38 you can't take so many risks-- especially if you have kids.

My final test may be the most restrictive. Do you actually want to start a startup? What it amounts to, economically, is compressing your working life into the smallest possible space. Instead of working at an ordinary rate for 40 years, you work like hell for four. And maybe end up with nothing-- though in that case it probably won't take four years.

During this time you'll do little but work, because when you're not working, your competitors will be. My only leisure activities were running, which I needed to do to keep working anyway, and about fifteen minutes of reading a night. I had a girlfriend for a total of two months during that three year period. Every couple weeks I would take a few hours off to visit a used bookshop or go to a friend's house for dinner. I went to visit my family twice. Otherwise I just worked.

Working was often fun, because the people I worked with were some of my best friends. Sometimes it was even technically interesting. But only about 10% of the time. The best I can say for the other 90% is that some of it is funnier in hindsight than it seemed then. Like the time the power went off in Cambridge for about six hours, and we made the mistake of trying to start a gasoline powered generator inside our offices. I won't try that again.

I don't think the amount of bullshit you have to deal with in a startup is more than you'd endure in an ordinary working life. It's probably less, in fact; it just seems like a lot because it's compressed into a short period. So mainly what a startup buys you is time. That's the way to think about it if you're trying to decide whether to start one. If you're the sort of person who would like to solve the money problem once and for all instead of working for a salary for 40 years, then a startup makes sense.

For a lot of people the conflict is between startups and graduate school. Grad students are just the age, and just the sort of people, to start software startups. You may worry that if you do you'll blow your chances of an academic career. But it's possible to be part of a startup and stay in grad school, especially at first. Two of our three original hackers were in grad school the whole time, and both got their degrees. There are few sources of energy so powerful as a procrastinating grad student.

If you do have to leave grad school, in the worst case it won't be for too long. If a startup fails, it will probably fail quickly enough that you can return to academic life. And if it succeeds, you may find you no longer have such a burning desire to be an assistant professor.

If you want to do it, do it. Starting a startup is not the great mystery it seems from outside. It's not something you have to know about 'business' to do. Build something users love, and spend less than you make. How hard is that?


Notes

[1] Google's revenues are about two billion a year, but half comes from ads on other sites.

[2] One advantage startups have over established companies is that there are no discrimination laws about starting businesses. For example, I would be reluctant to start a startup with a woman who had small children, or was likely to have them soon. But you're not allowed to ask prospective employees if they plan to have kids soon. Believe it or not, under current US law, you're not even allowed to discriminate on the basis of intelligence. Whereas when you're starting a company, you can discriminate on any basis you want about who you start it with.

[3] Learning to hack is a lot cheaper than business school, because you can do it mostly on your own. For the price of a Linux box, a copy of K&R, and a few hours of advice from your neighbor's fifteen year old son, you'll be well on your way.

[4] Corollary: Avoid starting a startup to sell things to the biggest company of all, the government. Yes, there are lots of opportunities to sell them technology. But let someone else start those startups.

[5] A friend who started a company in Germany told me they do care about the paperwork there, and that there's more of it. Which helps explain why there are not more startups in Germany.

[6] At the seed stage our valuation was in principle $100,000, because Julian got 10% of the company. But this is a very misleading number, because the money was the least important of the things Julian gave us.

[7] The same goes for companies that seem to want to acquire you. There will be a few that are only pretending to in order to pick your brains. But you can never tell for sure which these are, so the best approach is to seem entirely open, but to fail to mention a few critical technical secrets.

[8] I was as bad an employee as this place was a company. I apologize to anyone who had to work with me there.

[9] You could probably write a book about how to succeed in business by doing everything in exactly the opposite way from the DMV.

Thanks to Trevor Blackwell, Sarah Harlin, Jessica Livingston, and Robert Morris for reading drafts of this essay, and to Steve Melendez and Gregory Price for inviting me to speak.",
            title: "How to Start a Startup",
            header: "You need three things to create a successful startup: to start with good people, to make something customers actually want, and to spend as little money as possible. Most startups that fail do it because they fail at one of these. A startup that does all three will probably succeed.",
            format: article
          }
        ]
      }
    ]
  },

  # Influencer 2 : James Currier

  {
    name: 'James Currier',
    bio: "James is one of Silicon Valley’s foremost experts in growth and network effects. He's a four-time serial entrepreneur. He is also a pioneer of user-generated models, viral marketing, a/b testing, crowdsourcing, and myriad other growth techniques now followed by nearly all technology companies.",
    accounts: [
      {
        username: "jamescurrier",
        url:"https://twitter.com/jamescurrier",
        platform: twitter,
        media: []
      },
      {
        username: nil,
        url:"https://www.nfx.com/essays",
        platform: blog,
        media: [
          {
            url: "https://www.nfx.com/post/network-effects-alive-and-thriving",
            content: "Recently, my friend Sarah Lacy at Pando.com wrote yet another insightful thought piece about the state of venture investing and the startup world.  But this one emerged with an unfortunate title:\n “The death of network effects and the sad return of the VC kingmaker”\n The original idea for the article came from a conversation she and I had in October, which has nothing to do with network effects.  My point was that raising capital was becoming more important to success, not less, and thus VC’s are becoming kingmakers again. Thus, this article generously quotes me.\n Unfortunately, based on the title, several people have thought that I am now saying network effects are dead, despite being a Partner at a fund whose name is Network Effects Guild (NFX Guild).\n It would indeed be an irony if true, but nothing could be further from the truth.\n More than ever, we believe getting network effects are critical to building value in startups.  I believe this will be true for the rest of my lifetime.  So much so that my Partners and I spend many hours per week honing our skills at helping build network effects in our 65+ portfolio companies.\nNetwork effects are alive and thriving.  The most valuable companies have them, and the most valuable companies in the future will have them.\n – James",
            title: "Network Effects Are Not Dead, They Are Alive and Thriving",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: article
          }
        ]
      },
      {
        username: nil,
        url:"https://www.iangels.co/blog/",
        platform: external_blog,
        media: [
          {
            url: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/274053817&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true",
            content: nil,
            title: "Podcast: Network Effects with James Currier",
            header: "60% of the value created by tech companies since 1994 have 'network effects' at their core. In this podcast, entrepreneur, angel investor, and co-founder of the NFX Guild James Currier joins iAngels' host Max Marine to help define network effects and their implications for early-stage investors.",
            format: podcast
          }
        ]
      },
      {
        username: nil,
        url:"https://www.youtube.com/",
        platform: youtube,
        media: [
          {
            url: "https://www.youtube.com/watch?v=RGWG3_vfxiQ",
            content: nil,
            title: "Solving the Chicken or Egg Problem",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: video
          }
        ]
      }
    ]
  },

  # Influencer 3 : Brian Balfour

  {
    name: 'Brian Balfour',
    bio: "Founder/CEO of Reforge, previously VP Growth @ HubSpot. Brian Balfour has started multiple VC backed companies, and grown user bases to millions of daily active users. He writes detailed essays on growth and user acquisition that have been featured in Forbes, Hacker Monthly, and OnStartups to help build a growth machine.",
    accounts: [
      {
        username: "bbalfour",
        url:"https://twitter.com/bbalfour",
        platform: twitter,
        media: []
      },
      {
        username: nil,
        url:"https://brianbalfour.com/",
        platform: blog,
        media: [
          {
            url: "https://brianbalfour.com/essays/how-to-launch-a-product-or-feature-to-maximize-growth",
            content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            title: "How To Launch A Product or Feature To Maximize Growth",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: article
          }
        ]
      },
      {
        username: nil,
        url:"https://www.intercom.com/blog/",
        platform: external_blog,
        media: [
          {
            url: "https://art19.com/shows/inside-intercom/episodes/d207c7c8-3869-41b2-a5b8-40313ac29a93/embed",
            content: nil,
            title: "Brian Balfour on creating meaningful growth",
            header: "As VP of Growth at HubSpot, Brian oversees the growth teams for new products such as Sidekick and HubSpot CRM. You may also recognize his byline for articles about growth strategy, user acquisition, process, and teams from his popular blog, Coelevate.",
            format: podcast
          }
        ]
      },
      {
        username: nil,
        url:"https://www.youtube.com/",
        platform: youtube,
        media: [
          {
            url: "https://www.youtube.com/watch?v=RGWG3_vfxiQ",
            content: nil,
            title: "Brian Balfour: Building a Growth Machine",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: video
          }
        ]
      }
    ]
  },

  # Influencer 4 : Andrew Chen

  {
    name: 'Andrew Chen',
    bio: "Investor at Andreessen Horowitz, where he focuses on consumer products, marketplaces, and bottoms up SaaS. Previously, he led growth teams at Uber.",
    accounts: [
      {
        username: "andrewchen",
        url:"https://twitter.com/andrewchen",
        platform: twitter,
        media: []
      },
      {
        username: nil,
        url:"https://andrewchen.co/",
        platform: blog,
        media: [
          {
            url: "https://andrewchen.co/2018-essay-collection/",
            content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            title: "2018 essay collection on growth metrics, marketplaces, viral growth in the enterprise, and more",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: article
          }
        ]
      },
      {
        username: nil,
        url:"https://andrewchen.co/",
        platform: blog,
        media: [
          {
            url: "https://soundcloud.com/a16z/growth-user-acquisition",
            content: "<iframe width='100%' height='300' scrolling='no' frameborder='no' allow='autoplay' src='https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/483117867&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true'><\/iframe>",
            title: "The Basics of Growth 1 -- User Acquisition",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: podcast
          }
        ]
      },
      {
        username: nil,
        url:"https://www.youtube.com/",
        platform: youtube,
        media: [
          {
            url: "https://www.youtube.com/watch?v=m8DQpqJwo3Q",
            content: nil,
            title: "Chat with Andrew Chen, Supply Growth at Uber",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: video
          }
        ]
      }
    ]
  },

  # Influencer 5 : Connie Chan

  {
    name: 'Connie Chan',
    bio: "Connie Chan is a general partner at Andreessen Horowitz where she focuses on consumer tech investments. Since joining the firm in 2011, Connie has worked on the investment team sourcing consumer tech deals including Pinterest and Lime and worked closely with startups across the portfolio.",
    accounts: [
      {
        username: "conniechan",
        url:"https://twitter.com/conniechan",
        platform: twitter,
        media: []
      },
      {
        username: nil,
        url:"http://www.conniechan.com/",
        platform: blog,
        media: [
          {
            url: "https://a16z.com/2018/12/07/when-advertising-isnt-enough-multimodal-business-models-product-strategy/",
            content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            title: "Outgrowing Advertising: Multimodal Business Models as a Product Strategy",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: article
          }
        ]
      },
      {
        username: nil,
        url:"http://www.conniechan.com/#posts-and-podcasts",
        platform: blog,
        media: [
          {
            url: "https://soundcloud.com/a16z/mobile-design-culture-product",
            content: nil,
            title: "Culture and/of Design",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: podcast
          }
        ]
      }
    ]
  },

  # Influencer 6 : Marc Andreessen

  {
    name: 'Marc Andreessen',
    bio: "Marc Andreessen is a cofounder and general partner of the venture capital firm Andreessen Horowitz. He is an innovator and creator, one of the few to pioneer a software category used by more than a billion people and one of the few to establish multiple billion-dollar companies. \n
    Marc co-created the highly influential Mosaic Internet browser and co-founded Netscape, which later sold to AOL for $4.2 billion. He also co-founded Loudcloud, which as Opsware, sold to Hewlett-Packard for $1.6 billion. He later served on the board of Hewlett-Packard from 2008 to 2018.",
    accounts: [
      {
        username: nil,
        url:"http://blog.pmarca.com/",
        platform: blog,
        media: [
          {
           url: "https://a16z.com/2011/08/20/why-software-is-eating-the-world/",
           content: "This week, Hewlett-Packard (where I am on the board) announced that it is exploring jettisoning its struggling PC business in favor of investing more heavily in software, where it sees better potential for growth. Meanwhile, Google plans to buy up the cellphone handset maker Motorola Mobility. Both moves surprised the tech world. But both moves are also in line with a trend I’ve observed, one that makes me optimistic about the future growth of the American and world economies, despite the recent turmoil in the stock market.

In short, software is eating the world.

More than 10 years after the peak of the 1990s dot-com bubble, a dozen or so new Internet companies like Facebook and Twitter are sparking controversy in Silicon Valley, due to their rapidly growing private market valuations, and even the occasional successful IPO. With scars from the heyday of Webvan and Pets.com still fresh in the investor psyche, people are asking, “Isn’t this just a dangerous new bubble?”

I, along with others, have been arguing the other side of the case. (I am co-founder and general partner of venture capital firm Andreessen-Horowitz, which has invested in Facebook, Groupon, Skype, Twitter, Zynga, and Foursquare, among others. I am also personally an investor in LinkedIn.) We believe that many of the prominent new Internet companies are building real, high-growth, high-margin, highly defensible businesses.

Today’s stock market actually hates technology, as shown by all-time low price/earnings ratios for major public technology companies. Apple, for example, has a P/E ratio of around 15.2 — about the same as the broader stock market, despite Apple’s immense profitability and dominant market position (Apple in the last couple weeks became the biggest company in America, judged by market capitalization, surpassing Exxon Mobil). And, perhaps most telling, you can’t have a bubble when people are constantly screaming “Bubble!”

But too much of the debate is still around financial valuation, as opposed to the underlying intrinsic value of the best of Silicon Valley’s new companies. My own theory is that we are in the middle of a dramatic and broad technological and economic shift in which software companies are poised to take over large swathes of the economy.

More and more major businesses and industries are being run on software and delivered as online services — from movies to agriculture to national defense. Many of the winners are Silicon Valley-style entrepreneurial technology companies that are invading and overturning established industry structures. Over the next 10 years, I expect many more industries to be disrupted by software, with new world-beating Silicon Valley companies doing the disruption in more cases than not.

Why is this happening now?

Six decades into the computer revolution, four decades since the invention of the microprocessor, and two decades into the rise of the modern Internet, all of the technology required to transform industries through software finally works and can be widely delivered at global scale.

Over two billion people now use the broadband Internet, up from perhaps 50 million a decade ago, when I was at Netscape, the company I co-founded. In the next 10 years, I expect at least five billion people worldwide to own smartphones, giving every individual with such a phone instant access to the full power of the Internet, every moment of every day.

On the back end, software programming tools and Internet-based services make it easy to launch new global software-powered start-ups in many industries — without the need to invest in new infrastructure and train new employees. In 2000, when my partner Ben Horowitz was CEO of the first cloud computing company, Loudcloud, the cost of a customer running a basic Internet application was approximately $150,000 a month. Running that same application today in Amazon’s cloud costs about $1,500 a month.

With lower start-up costs and a vastly expanded market for online services, the result is a global economy that for the first time will be fully digitally wired — the dream of every cyber-visionary of the early 1990s, finally delivered, a full generation later.

Perhaps the single most dramatic example of this phenomenon of software eating a traditional business is the suicide of Borders and corresponding rise of Amazon. In 2001, Borders agreed to hand over its online business to Amazon under the theory that online book sales were non-strategic and unimportant.

Oops.

Today, the world’s largest bookseller, Amazon, is a software company — its core capability is its amazing software engine for selling virtually everything online, no retail stores necessary. On top of that, while Borders was thrashing in the throes of impending bankruptcy, Amazon rearranged its web site to promote its Kindle digital books over physical books for the first time. Now even the books themselves are software.

Today’s largest video service by number of subscribers is a software company: Netflix. How Netflix eviscerated Blockbuster is an old story, but now other traditional entertainment providers are facing the same threat. Comcast, Time Warner and others are responding by transforming themselves into software companies with efforts such as TV Everywhere, which liberates content from the physical cable and connects it to smartphones and tablets.

Today’s dominant music companies are software companies, too: Apple’s iTunes, Spotify and Pandora. Traditional record labels increasingly exist only to provide those software companies with content. Industry revenue from digital channels totaled $4.6 billion in 2010, growing to 29% of total revenue from 2% in 2004.

Today’s fastest growing entertainment companies are videogame makers — again, software — with the industry growing to $60 billion from $30 billion five years ago. And the fastest growing major videogame company is Zynga (maker of games including FarmVille), which delivers its games entirely online. Zynga’s first-quarter revenues grew to $235 million this year, more than double revenues from a year earlier. Rovio, maker of Angry Birds, is expected to clear $100 million in revenue this year (the company was nearly bankrupt when it debuted the popular game on the iPhone in late 2009). Meanwhile, traditional videogame powerhouses like Electronic Arts and Nintendo have seen revenues stagnate and fall.

The best new movie production company in many decades, Pixar, was a software company. Disney — Disney! — had to buy Pixar, a software company, to remain relevant in animated movies.

Photography, of course, was eaten by software long ago. It’s virtually impossible to buy a mobile phone that doesn’t include a software-powered camera, and photos are uploaded automatically to the Internet for permanent archiving and global sharing. Companies like Shutterfly, Snapfish and Flickr have stepped into Kodak’s place.

Today’s largest direct marketing platform is a software company — Google. Now it’s been joined by Groupon, Living Social, Foursquare and others, which are using software to eat the retail marketing industry. Groupon generated over $700 million in revenue in 2010, after being in business for only two years.

Today’s fastest growing telecom company is Skype, a software company that was just bought by Microsoft for $8.5 billion. CenturyLink, the third largest telecom company in the U.S., with a $20 billion market cap, had 15 million access lines at the end of June 30 –declining at an annual rate of about 7%. Excluding the revenue from its Qwest acquisition, CenturyLink’s revenue from these legacy services declined by more than 11%. Meanwhile, the two biggest telecom companies, AT&T and Verizon, have survived by transforming themselves into software companies, partnering with Apple and other smartphone makers.

LinkedIn is today’s fastest growing recruiting company. For the first time ever, on LinkedIn, employees can maintain their own resumes for recruiters to search in real time — giving LinkedIn the opportunity to eat the lucrative $400 billion recruiting industry.

Software is also eating much of the value chain of industries that are widely viewed as primarily existing in the physical world. In today’s cars, software runs the engines, controls safety features, entertains passengers, guides drivers to destinations and connects each car to mobile, satellite and GPS networks. The days when a car aficionado could repair his or her own car are long past, due primarily to the high software content. The trend toward hybrid and electric vehicles will only accelerate the software shift — electric cars are completely computer controlled. And the creation of software-powered driverless cars is already under way at Google and the major car companies.

Today’s leading real-world retailer, Wal-Mart, uses software to power its logistics and distribution capabilities, which it has used to crush its competition. Likewise for FedEx, which is best thought of as a software network that happens to have trucks, planes and distribution hubs attached. And the success or failure of airlines today and in the future hinges on their ability to price tickets and optimize routes and yields correctly — with software.

Oil and gas companies were early innovators in supercomputing and data visualization and analysis, which are crucial to today’s oil and gas exploration efforts. Agriculture is increasingly powered by software as well, including satellite analysis of soils linked to per-acre seed selection software algorithms.

The financial services industry has been visibly transformed by software over the last 30 years. Practically every financial transaction, from someone buying a cup of coffee to someone trading a trillion dollars of credit default derivatives, is done in software. And many of the leading innovators in financial services are software companies, such as Square, which allows anyone to accept credit card payments with a mobile phone, and PayPal, which generated more than $1 billion in revenue in the second quarter of this year, up 31% over the previous year.

Health care and education, in my view, are next up for fundamental software-based transformation. My venture capital firm is backing aggressive start-ups in both of these gigantic and critical industries. We believe both of these industries, which historically have been highly resistant to entrepreneurial change, are primed for tipping by great new software-centric entrepreneurs.

Even national defense is increasingly software-based. The modern combat soldier is embedded in a web of software that provides intelligence, communications, logistics and weapons guidance. Software-powered drones launch airstrikes without putting human pilots at risk. Intelligence agencies do large-scale data mining with software to uncover and track potential terrorist plots.

Companies in every industry need to assume that a software revolution is coming. This includes even industries that are software-based today. Great incumbent software companies like Oracle and Microsoft are increasingly threatened with irrelevance by new software offerings like Salesforce.com and Android (especially in a world where Google owns a major handset maker).

In some industries, particularly those with a heavy real-world component such as oil and gas, the software revolution is primarily an opportunity for incumbents. But in many industries, new software ideas will result in the rise of new Silicon Valley-style start-ups that invade existing industries with impunity. Over the next 10 years, the battles between incumbents and software-powered insurgents will be epic. Joseph Schumpeter, the economist who coined the term “creative destruction,” would be proud.

And while people watching the values of their 401(k)s bounce up and down the last few weeks might doubt it, this is a profoundly positive story for the American economy, in particular. It’s not an accident that many of the biggest recent technology companies — including Google, Amazon, eBay and more — are American companies. Our combination of great research universities, a pro-risk business culture, deep pools of innovation-seeking equity capital and reliable business and contract law is unprecedented and unparalleled in the world.

Still, we face several challenges.

First of all, every new company today is being built in the face of massive economic headwinds, making the challenge far greater than it was in the relatively benign ’90s. The good news about building a company during times like this is that the companies that do succeed are going to be extremely strong and resilient. And when the economy finally stabilizes, look out — the best of the new companies will grow even faster.

Secondly, many people in the U.S. and around the world lack the education and skills required to participate in the great new companies coming out of the software revolution. This is a tragedy since every company I work with is absolutely starved for talent. Qualified software engineers, managers, marketers and salespeople in Silicon Valley can rack up dozens of high-paying, high-upside job offers any time they want, while national unemployment and underemployment is sky high. This problem is even worse than it looks because many workers in existing industries will be stranded on the wrong side of software-based disruption and may never be able to work in their fields again. There’s no way through this problem other than education, and we have a long way to go.

Finally, the new companies need to prove their worth. They need to build strong cultures, delight their customers, establish their own competitive advantages and, yes, justify their rising valuations. No one should expect building a new high-growth, software-powered company in an established industry to be easy. It’s brutally difficult.

I’m privileged to work with some of the best of the new breed of software companies, and I can tell you they’re really good at what they do. If they perform to my and others’ expectations, they are going to be highly valuable cornerstone companies in the global economy, eating markets far larger than the technology industry has historically been able to pursue.

Instead of constantly questioning their valuations, let’s seek to understand how the new generation of technology companies are doing what they do, what the broader consequences are for businesses and the economy and what we can collectively do to expand the number of innovative new software companies created in the U.S. and around the world.

That’s the big opportunity. I know where I’m putting my money.",
           title: "Why Software Is Eating the World",
           header: "This article was originally published in The Wall Street Journal on August 20, 2011.",
           format: article
          }
        ]
      },
      {
        username: nil,
        url:"https://a16z.com/2018/",
        platform: external_blog,
        media: [
          {
            url: "https://soundcloud.com/a16z/talent-tech-trends-culture-ben-marc-tyler-cowen-summit-2018",
            content: nil,
            title: "Talent, Tech Trends, and Culture",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: podcast
          }
        ]
      },
      {
        username: nil,
        url:"https://www.youtube.com/",
        platform: youtube,
        media: [
          {
            url: "https://www.youtube.com/watch?v=JYYsXzt1VDc",
            content: nil,
            title: "Big Breakthrough Ideas and Courageous Entrepreneurs",
            header: "Marc Andreessen, Co-Founder & Partner at Andreessen Horowitz, discusses his philosophy on investing in technical founders and the role of technology in today's startups. Andreessen also addresses the kind of entrepreneurs and ideas his venture capital firm look for: 'Big breakthrough ideas often seem nuts the first time you see them.'",
            format: video
          }
        ]
      }
    ]
  },

  # Influencer 7 : Sam Altman

  {
    name: 'Sam Altman',
    bio: "Sam Altman is an American entrepreneur, investor, programmer, and blogger. He is the president of Y Combinator and co-chairman of OpenAI.",
    accounts: [
      {
        username: "sama",
        url:"https://twitter.com/sama",
        platform: twitter,
        media: []
      },
      {
        username: nil,
        url:"https://blog.samaltman.com/",
        platform: blog,
        media: [
          {
            url: "https://blog.samaltman.com/how-to-be-successful",
            content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            title: "How To Be Successful",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: article
          }
        ]
      },
      {
        username: nil,
        url:"https://mastersofscale.com/",
        platform: external_blog,
        media: [
          {
            url: "https://rss.art19.com/episodes/85928af6-62aa-4d53-ac55-0c3300241767.mp3",
            content: "REID HOFFMAN: My friend, Sam Altman, is a bit of a geek.  And he’s OK with me saying that. I asked.


SAM ALTMAN: …to talk about my nerdy qualities, I approve of that.



HOFFMAN: I thought you did.



Many people have noted you have an affinity for cargo shorts.



ALTMAN: Honestly, I don’t think they’re that ugly, and I find them incredibly convenient. You can like put a lot of stuff… I still read paperback books, I like to carry one around with me. I carry like, computer chargers, cables, they’re just like efficient.



HOFFMAN: It’s somewhat your Batman utility belt.



ALTMAN: Yeah, you just can carry a lot of stuff.



HOFFMAN: People don’t often ask Sam directly about his cargo shorts. Or his geekiness, for that matter. Sam’s the president of Y Combinator, one of Silicon Valley’s most prestigious startup accelerators. He’s incredibly respected, and founders everywhere know that he can can make or break their fledgling company.



But if you really want to understand Sam, you’ve gotta understand what species of geekdom he falls under. Sam is not just your garden variety geek. He’s a student of the history of geeks.



ALTMAN: An aspiring student.



HOFFMAN: Aspiring student, with a fascination for an entire range of tech.



So one of the pieces of tech that you ended up getting was a bronze sword.



ALTMAN: …I’m not sure exactly which sword you’re referring to,



HOFFMAN: Turns out, Sam has a whole collection of swords and battle axes. And this fascination with ancient weaponry has put him in some uncomfortable situations. I asked him about one.



HOFFMAN: One of the things I learned from the New Yorker profile is that you occasionally bring a sword in with you to interview an entrepreneur.



ALTMAN: No, that’s not true.



HOFFMAN: No?



ALTMAN: Either they wrote that wrong… No, I think I remember what happened.



HOFFMAN: So here’s the story as Sam remembers it: A reporter from the New Yorker had been shadowing him for weeks to work on a profile. They’re in Sam’s home office, sitting through meeting after meeting, and Sam is getting bored.



ALTMAN: It’s the 16th meeting of the day and I needed some energy.



HOFFMAN: Suddenly, a package arrives, and Sam gets really excited.



ALTMAN: I had bought this Bronze Age sword.



HOFFMAN: Yes, you heard that right. A Bronze Age sword.



ALTMAN: It had just arrived, and I had been waiting for this thing, you know, like it had flown all the way from Europe and it was in this big crate, and I got it out. It’s stunning, perfect. And so I was like so excited.



I mean the first thing you do is like pick up and swing it, and see like how it’s weighted, how it feels. This particular one it had, like you know, the nicks where it hit people’s helmets a couple of thousand years ago. It’s a little dark, but…



HOFFMAN: Or maybe bones, right?



ALTMAN: Too much of a nick for a bone. Too deep of a nick in the metal.



HOFFMAN: The nicks in the metal might not have been from bones, but he’s swinging around this massive weapon from the Bronze Age with a journalist from The New Yorker in the room. And the day isn’t over yet.



ALTMAN: I was on the phone, and it was kind of like a not particularly exciting conversation. So I picked it up, and I just started, while I was on the speakerphone, swinging around and fighting this pretend enemy because I was so excited. I just got this. I had been waiting for it for so long. And I didn’t realize ‘till I put it down at the end that that was probably really dumb, and it was probably going to make it into the profile. Because a reporter was sitting there watching. You kind of just forget after someone’s with you for weeks. But I have never swung a sword at someone during an interview process.



HOFFMAN: I’m glad we can finally put that rumor to rest. The Headline “Sam Altman swings swords at young company founders” can officially be put in the category: Fake News.



He’s not just an Ancient History geek, he’s a geek history geek. He collects tech artifacts — from historic computers to jet engines – any object that represents a breakthrough in engineering history. And that’s also essentially what he’s searching for today. A technology that’s so new, so unlike anything that’s come before, it unleashes a geyser of demand. There have been consumers, across all eras, who just had to have the next big thing.



And if the history of geekdom has taught Sam anything, it’s that a product that’s deeply loved by a small group of early users is a product that can scale. I agree. And in fact, I believe it’s more important to have 100 people who LOVE your product than a million who just sort of like it.



[THEME MUSIC]



HOFFMAN: I’m Reid Hoffman, co-founder of LinkedIn, investor at Greylock and your host. And while I’m obviously a big believer in creating things that can scale, I believe it’s more important to have 100 people who LOVE your product than one million who just sort of like it.



And this isn’t always obvious. Many entrepreneurs fall into the trap of chasing the illusion of scale – the one million users who show up to use a flash-in-the pan product. What you actually want to do is seek out the true seed of scale, which has much humbler origins. Many great scale stories begin with a tiny kernel of die hard fans, no more than 100 strong — who are almost zealous in their passion for your work. They hang on your every product release. They can’t believe they ever lived without you.


Think of Sam when that sword arrived.



ALTMAN: I was so excited. I just got this. I had been waiting for it for so long.



HOFFMAN: It sounds like that.



And when a user like Sam gets excited, that matters — not only because it drives use and loyalty, but because it will drive him to tell his friends. And if he tells two friends. And they each tell two friends. And they each tell two friends. Well, that story gets pretty big pretty fast.



I wanted to talk to Sam Altman about this, because he has an uncanny eye for these kernels of passionate, early users. Y Combinator has become known as a kingmaker in Silicon Valley. Their alumni include AirBnB, Dropbox, Stripe, Reddit, and more than 40 companies that are valued at 100 million dollars or more after being incubated at Y Combinator— or YC as we call it. But Sam doesn’t look for kings. He looks for startups that show these early signs of love from their users.



And how does he spot them? He pattern-matches with history. Think about his private collection of engineering milestones. He has an insatiable appetite for these objects, and his collection is constantly expanding.



ALTMAN: I like things that were super-important technological milestones in human history, even if they look like not really technology. So I’ve got a big collection of handaxes, which is the longest-serving by far—like a million-and-a-half years—piece of technology in human history.



HOFFMAN: Is there any particular artifact that you’re hunting for?



ALTMAN: I don’t know how I’m going to get this one, but I would like an F-1 engine, or at least I would like the bell of an F-1 engine.



You know, Bezos got one by pulling it out of the ocean, and convincing NASA to loan it to him. I mean, that’s really a lot of work.



HOFFMAN: Is there another one or two? Because this is actually personally fun.



ALTMAN: Alan Kay gave me an Alto.



VOICE: Alan Kay created the first computer with a graphical interface, called the Alto. It inspired the first Macintosh.



ALTMAN: That’s not the very last computer that I think is within my capability to understand everything that’s happening in there, but it’s getting near the end.



HOFFMAN: This collection is like the whetstone Sam uses to sharpen his instincts. When he’s deciding which founder to admit into a Y-Combinator class, he looks for a ground-breaking idea that has the potential to give users something they can’t live without. If he doesn’t see it, he passes.

But to understand how Sam spots the indispensable startups, you have to know how he arrived at YC himself. He wasn’t predestined to become the startup kingmaker. When he graduated from college, it could’ve gone either way.



ALTMAN: I’m very ashamed to say that I had been planning to go be an intern at Goldman Sachs that summer.



HOFFMAN: “Ashamed” is a pretty strong word. And a distinctly Silicon Valley reaction. After all, it’s tougher to get a job at Goldman Sachs than it is to get into Harvard. Only about three percent of applicants get hired. It would make his family proud and his friends envious.  He could live comfortably ever after.



Or he could take a far less comfortable path — one better suited to my cargo-short-wearing, bronze-age-sword-wielding friend. It began with a little mobile app Sam and his friends developed while studying at Stanford. It was called Loopt, and it let you share your location with friends.



ALTMAN: It started as just a project that we worked on sort of like after class and at night. We had worked on it during a spring quarter and it was really fun.



HOFFMAN: “Fun” isn’t exactly a sound business plan. And what makes this idea even shakier, is that it’s 2005 — two years before the first iPhone was even invented. The word “app store” had not entered into our vocabulary. So the odds of making money with this mobile app were incredibly low. And remember, the odds of making money at Goldman Sachs are 100 percent. The odds were stacked against Sam and his startup, and everyone could see it.



ALTMAN: If you said you were working on a startup, people sort of laughed at you in a not nice way.



HOFFMAN: But not everyone was laughing. A new community was just forming. One that was deadly serious about startups — and fun. It was called Y Combinator, and it immediately called out to Sam. For starters, its founder was the now legendary computer scientist and entrepreneur Paul Graham.



ALTMAN: We all kind of knew who Paul Graham was. We had followed him online and he posted this thing saying like hey, not excited about your summer job? Come hack on your project and you know make a startup and it seemed like it would be more fun than being an investment banker.



HOFFMAN: Fun actually can make business sense. If you love what you’re doing, and other people do too. And Paul was determined to prove that young innovators with deep passions could find success if they were willing to take a gamble.



But this was a controversial idea outside of Y Combinator. Paul Graham was considered a sort of pied piper for young entrepreneurs — leading them down the road to ruin.



He wrote an essay about this, in 2007, which you can find on Masters of Scale.com.



Traditionally, investors would fund a company in stages — show me growth, and I’ll show you the money. Step-by-step you had to show user growth, hypothesize how much they’d spend on your product and lay out in painfully minute detail how much money you’ll need and how much money you’ll make. It’s classic Business 101 thinking. And it can be exasperating for a founder.



I experienced it myself when I was raising a series A round for LinkedIn. Right around the time Sam was a college student, I was looking for investors.



At the time, potential Series A investors wanted to see a business model that showed how LinkedIn would get to profitability. I told potential investors that we weren’t going to generate revenue until after the next round of funding, and that therefore it shouldn’t matter to them. They insisted anyway, so the team and I generated a financial model that included revenue sources. I don’t even remember what we put in it! Rather than wasting weeks on it, we simply set aside a single evening, drank a couple of glasses of wine, and put together the model. I might have been a little miffed at even having to waste the single evening, but it was pretty good wine, so it wasn’t a total waste.



Contrast that with an investor like Paul Graham. He says, “Forget the spreadsheets. Quit speculating. Just start building on a shoestring budget — and build something a tiny cohort of users will love. Love is all you need.”



Some of you might be rolling your eyes at this idea that love is all you need. So I want to share a story that might soften your cynicism. It comes from Dominique Ansel, the famed New York chef who invented a pastry that became a global sensation. You may have heard of it. It’s called… The cronut. It’s part donut, and part croissant.



Ever since the cronut became the hottest thing since sliced bread, people have been mistaking Dominique for a master of publicity. A sort of PT Barnum of the baking world. So our producers visited Dominique’s Manhattan bakery, and asked how he engineers these publicity coups. Dominique’s answer: He doesn’t.



DOMINIQUE ANSEL: There was no marketing. There was a team of literally four employees and myself and when people approach me and ask me what my marketing strategy was and what was my budget to launch a company like this, I’m “You guys don’t understand. It didn’t happen this way.” We’re a small, small bakery. A tiny bakery. A neighborhood bakery on a street of Soho and it happened naturally, organically.



HOFFMAN: Here’s Dominique’s memory of how the cronut scaled, naturally. Every day, he bakes a fresh batch of croissants, and studies them like a scientist.



ANSEL: I actually look at it every day. I cut it in half and I look at what we call the honeycomb which is the structure created by the fermentation of the dough. All this little air pockets that are inside. The fermentation, you have to smell it. It’s a different type of fermentation. The crust, the volume, the flakiness, everything is so, so important. It’s alive.



HOFFMAN: This obsession with the fermentation, the flakiness, the technical details — reminds me of all the great product designers I know. Dominique was singular in his focus in getting his croissants right. Then one day, Dominique’s staff challenged him to make a donut instead.



ANSEL: I don’t do donuts. I told them that I have no recipe for donuts since I’m French, but I most definitely can come up with something new, something special.



HOFFMAN: 100 taste tests later, the cronut was born. A food blogger, Hugh Merwan, arrives, snaps a photo, and shared the invention with his fans on GrubStreet. The massive response stunned even the blogger.



ANSEL: He called me the same afternoon letting me know that he had an increase of traffic of 300% on his website and over 140,000 link and he told me to be ready to be busy tomorrow.



I had no idea what he was talking about. I was happy for him. I told him “I’m happy for you. I need to go to sleep.”



HOFFMAN: Dominique and his staff were facing a situation I’m all too familiar with: It’s the inevitable fallout on the morning after the overnight success.



ANSEL: And the next day we had over 100 people outside. By the third day, we had over 150 people waiting outside. It was just overwhelming for everyone and it was very sudden and this doesn’t happen, but it happened to us. It was just overwhelming for everyone. The staff all wanted to quit. It was too much.



HOFFMAN: The rest is pastry history. And if Dominique’s staff initially wanted to quit, they soon learned to cultivate the unexpected outpouring of love. His staff treats the loyal customers lined up outside like invited guests, serving them hot chocolate before the bakery opened each day.



ANSEL: I think it’s important for any chef to be in touch with the guest, the customers. To see them and listen to them. Especially for the holidays to be there for them. To wish them a happy holidays and thank them for keep on coming to our shop. I think it’s important we have a lot of very loyal customers. A lot of people from the neighborhood and at the end of the day, a bakery is a local business. It is a neighborhood business and it’s not life without the people in the neighborhood.



HOFFMAN: If you’ve never waited in line to enter a popular New York store — like Supreme, for example — you may not realize just how radical these small acts of kindness are. And I suspect it had no small impact on the cronut’s success.



But if you think Dominique now sits around trying to concoct the next novelty goodie, think again.



ANSEL: I don’t think there’s a need or a desire for me to try to recreate something like the cronut. I don’t think I can and I don’t think I want. I aim to create pastries that talk to people and of course I want them to be popular. Of course I want them to be successful. Of course I want people to appreciate it, but I’m not trying to be gimmicky or trying do something that doesn’t mean anything to me. I’m still trying to translate my ideas through pastries. You cannot force it. Even with all the money in the world, you cannot recreate the cronut. Even if you can hire the biggest team, the smartest people, you cannot recreate something like the cronut.



HOFFMAN: You could apply the same argument to just about any globally successful product. All the money and all of the marketing savvy in the word cannot sustain its growth in the long-run. You need more than your customer’s attention. You need their unflagging devotion. And this poses an almost Zen-like riddle for entrepreneurs: The first step to scale is to renounce your desire to scale. Focus on those happy few.



This is a concept that every artisanal maker of small-batch goods grasps instinctively. Scale entrepreneurs? Not so much. But Paul Graham was determined to prove that the same fundamental truths applied to entrepreneurs with global ambitions.



And to prove his point, he offered a laughably small sum of seed money to those early Y Combinator entrepreneurs, like Sam: Each one got $6,000, plus free dinners. That’s it. Off you go. Sam was intrigued.



ALTMAN: So we applied to YC and flew out and interviewed and got funded. We’re actually the first company ever funded by YC and then it just kept going.



HOFFMAN: So Sam entered what’s known as the first class of entrepreneurs to get accepted into Y Combinator. And they were essentially the guinea pigs who were meant to validate Paul Graham’s theory of scale. And Sam offered quite the validation.



After graduating from YC, his company Loopt struck deals with Sprint, Verizon, Blackberry, and AT&T. With the advent of the iPhone, they were positioned for growth, and became one of the first offerings in the iPhone App store. Here’s Sam, sharing the stage with Steve Jobs in 2008:



ALTMAN [Recording]: We are incredibly psyched about Loopt on the iPhone. Location, plus a contact list, and information about cool places means you never have to eat lunch alone again, or at a bad place. And we think that’s really cool, we really do. You can use Loopt with your friends on most other carriers…



HOFFMAN: In 2012, Loopt was acquired by Green Dot Corporation for more than 43 million dollars.



ALTMAN: We got acquired and I was trying to figure out what I wanted to do next.



HOFFMAN: Sam was 26 years old.



ALTMAN: And I decided I was going to partly take a like a sort of mid-career sabbatical race cars, fly airplanes, travel the world, all that kind of stuff.



HOFFMAN: When he wasn’t on the race track or in the air, Sam tried his hand at the venture capital game. He had an eye for it, investing early in companies with real potential. But it just wasn’t his idea of fun.



ALTMAN: I liked running a company I did not like being on the sidelines and I didn’t get the adrenaline rush I get out of being in the trenches of running a company, which I think is something that a lot of founders miss when they start investing.



HOFFMAN: Sam missed being in the trenches. He felt adrift. And Paul Graham, Sam’s mentor, could see it.



ALTMAN: And I was thinking about things I wanted to do and Paul Graham sort of jokingly said a number of times over the years that I’m going to retire and you should take over YC.



HOFFMAN: Turns out Paul Graham was only half joking. In 2014, he asked Sam, in all seriousness, to take over Y Combinator. Sam accepted the offer, and became President of Y Combinator at the age of 28.



Despite his youth, he was the perfect fit. YC isn’t just an investment firm. It’s an incubator for founders who want to reshape the future. Think of Y Combinator as an extension of his bronze age sword collection — only this time he’s collecting the people who can make the swords that will change the world.



So where does he begin? He begins with a simple mantra. He repeats it to every founder that comes through YC’s doors: Love is better than like.



I asked him why it bears repeating.



HOFFMAN: So love is much better than like. Why this central mantra within YC, and all of the startups that are coming through?



ALTMAN: Well, I think there’s a few different reasons for that. One is it objectively seems to be true. If you look at the companies that have gone to become super important and valuable, and shaped the world in a big way, they tend to have fairly fanatical early users. If you think about how you first came across Facebook or Google, it’s very likely because a friend told you how great it was.



HOFFMAN: It is indeed objectively true that these hit products spread by word of mouth. On the other hand, I can point to a whole graveyard of startups that started out with passionate users. And then the passion faded. The startup withered away and died of loneliness. It’s heartbreaking.



So passion is a great early indicator of success, but it leads to a vital question that every founder must ask a user: How deep is your love?



Sam has a clever way to plumb the depths of their affection. When the first iPhone came to market, everyone was agog at its new features — a touch screen! Apps! Music on your phone! But Sam wasn’t just studying the features. He was studying iPhone users. Intently.



ALTMAN: So one of the things that was obvious when people got iPhones even though you know only a few million of the first iPhones sold, most people who had them used them every day and loved them and it became like their most precious item.



I remember shortly after the iPhone came out I was in a developing world country it was really quite poor and people had nothing except they all had a smartphone. And once they had one like you know you read these statistics and people need to do some lightweight journalism about, “Would you rather give up your smartphone or X” and it doesn’t really matter what X is, they’re gonna keep the smartphone.



And so I think you could have predicted with a lot of certainty, and many people did, that this was going to be a large market.



HOFFMAN: This is a rather extreme case of attachment to a product. The odds that you’ll create a product that is so addictive, your fans would give up all their other worldly possessions for it — are pretty much slim to none. But the extremity of that thought experiment is clarifying.



You want to make your product as indispensable as humanly possible. That’s your primary objective — before you shore up your business plan, or plan your PR campaign, or any other steps along the road to world domination. Your first step must be, make yourself indispensable. But the truth is, you’re unlikely to build a product that makes a user say “I’d give up my left arm to use this.” So short of that ideal, Sam sets a more modest objective for founders. Focus on love, not likes. Sam can’t stress this enough.



ALTMAN: And that’s really important, because the startups, once they get big enough, can only grow by word of mouth. All of the growth hacking eventually stops working. If you’re going to keep growing exponentially at some point, it is probably going to be because people tell you, “You’ve got to use this product with me,” or, “You’ve got to try this, it’s so great.”



HOFFMAN: “You’ve gotta try this.” There’s a hidden power to that simple phrase — which Y Combinator has elevated to an almost mythic status. It’s like “open sesame.” Once invoked, Y Combinator graduates react as if a wall has opened up before their eyes, and the secret pathway to scale is laid out at their feet. They know that if they keep hearing the words “You’ve gotta try this,” it will propel them into the far-off future, the years that their valuation is based on.



ALTMAN: And that seems to be really important, because the startups—so much of the value is in the far-out years.



And in those years, it depends on continuing to grow at these fantastic rates.



HOFFMAN: By fantastic rates, he means “exponential” rates — the sort of viral growth that can only occur when that first cohort of users says “You’ve gotta try this” to two friends each, and they say “You’ve gotta try this” to two friends. And so on and so on. This can scale to millions of users in a matter of months.



But make no mistake, it’s exceedingly difficult to kick off this chain reaction, unless you’re willing to hone in on a tiny cohort of users. You should almost have a willful blindness to growth, and a monomaniacal focus on making just a few people happy.



AUBRIE PAGANO: You win people over one person at a time.



HOFFMAN: That’s Aubrie Pagano, co-founder and CEO of Bow & Drape, a fashion line that lets customers personalize the design and fit of any piece of clothing. And she had to fight for that early cult following.



PAGANO: It’s hand to hand combat, and especially when you’re under resourced, even when you are well resourced actually, it doesn’t matter.



There’s no cutting corners around that. You can’t throw enough money at that problem, you can’t trick people into loving your brand. You just have to win that over. That’s how we grew the brand. We grew the brand through word of mouth. We didn’t even start marketing until last year.



HOFFMAN: Mind you, they’ve been in business for five years – and by their third year, Bow & Drape had grown revenue by over 300 percent from their first.



PAGANO: It was all word of mouth. And I really do think that that is such an important part to early success.



HOFFMAN: And if your users really can’t stop raving about your product, you can defer marketing indefinitely. Even if that product is…underwear. No matter what kind you wear, no matter what gender you are, I’m going to bet that you’ve heard of them. Spanx has been the name in undergarments since it launched in 2000. Sara Blakely, the founding CEO, has come a long way since she was shipping packages from her home in Atlanta. One thing she never updated? Her marketing plan.



SARA BLAKELY: I ran Spanx out of my apartment for two and a half years with a handful of people before we moved out of my apartment. You know, it’s been like that. I mean I had $5000 and I’ve been self-funded from the start. So I didn’t ever raise a bunch of money, I didn’t even know how to do that or that that was even really an option. And you know Spanx has never advertised until this year and we’re 16 years old. So this has been a word of mouth brand.



HOFFMAN: And Sara didn’t spread the word about Spanx on her own—she recruited an all-volunteer sales force. She found a way to enlist department store clerks to her cause — by setting up booths in quiet store corners. Sara’s enthusiasm was infectious—not just to shoppers, but to anyone within earshot.



BLAKELY: So for the next two years I stood in department stores for literally eight hours a day and in the entrance of Neiman’s or where cosmetics were were there were so much more foot traffic.

I set up a little table and I had my own display table and I brought my own television with a VCR in it and put the Oprah tape in there and some other news clips that had happened to me and I was like a one woman show. What I was doing is I was creating this very loyal sales force that wasn’t on my payroll because I would win over all of the associates at every Neiman Saks Nordstrom that sold the product by being there and explaining it and giving away free product to them. I would do morning rallies for the store before the store opened.



HOFFMAN: So Sara targeted users who would bring in more users. She honed in on heavy hitters: people who already had the platform to do her marketing for her. The power of word of mouth is multiplied exponentially if you can recruit anyone that comes with a megaphone—whether it’s a salesperson in a department store or Oprah Winfrey. But what comes next? After you have gathered new users around, how do you know they’ll stick around?



At a certain point, as you’re zipping up a growth curve, you may think those users are here to stay. Retention is strong. Growth is ticking upward. And the only thing standing between you and global domination is a slick sales and marketing campaign. You’ll try to hack your way to growth through targeted ad campaigns and promotional offers. And you’ll have all of the appearances of growth. But Sam has a warning for you. Scaling falls into two categories — the easy kind and the hard kind. And you may not know you’re doing the hard kind of scaling until it’s too late.



ALTMAN: The hard kind of blitz scaling is where you try to start scaling up before the product is really great. And then most of your effort in scaling is to generate demand. So I think the number one most important insight about how to blitz scale is that the good kind of blitz scale is when you are not having to generate demand as you go but that you first got the product right.



HOFFMAN: So the easy kind of scaling is when you first got the product right. When you’ve created something users LOVE, and instinctively want to share. This kind of scaling happens organically, as users bring in other users. The hard kind of scaling is when you only get the product half-right. When you’ve created something users KIND of like, and which they’ll use. But not something so good that they stick with it, and certainly not so good that they’d think to share it.



ALTMAN: And that’s something we see, again and again. People don’t stick with products that they don’t love. And so it is easy to get a lot of people to try something with a clever growth hack.



The value of those users is often very low. They use it for a little while, you engage them with some trick, and they don’t stick around. And that is not how you build these enduring, valuable companies. You need things that people want to come back to and use a lot, and I think it’s much easier to figure that out early, when you can still make a lot of changes to the product. Everyone’s like, “Well, I’m just going to get a lot of people to like me, and then I’ll figure out how to make them love it later.”



In practice, that’s really rare. I would challenge you to think of an example.



HOFFMAN: Challenge accepted. I actually founded one of these companies: LinkedIn. One rather striking exception to Sam’s rule.



We had a passionate set of early users, but these were not the users that helped us get to scale. We were grateful, we appreciated their support, but what they ultimately wanted from us wasn’t something that we could deliver. I explained this to Sam in our interview.



HOFFMAN: And so LinkedIn, for example, is one, because of our early users who loved us, called “open networkers,” they put it in their headline—called “LIONS”—”LinkedIn Open Networkers.” They loved us because they wanted us to be something different than what we were. They wanted the whole world to say, “Everyone should be able to connect to Bill Gates, and have him connect back.”



And it’s unrealistic about Bill’s time and commitments, and things he needs to be doing. And so we are not an open network. And it took us to get to scale, when other people started loving us, the kind of people that we were targeting.



Because the thing that I completely agree with is, well, if you don’t have millions of people loving you, you don’t have a fundamental company. But the question is, the initial people we had loving us at LinkedIn were not the people that we wanted to love us when we were hundreds of millions.



ALTMAN: We’ve seen a version of this pattern a bunch of times, which is, if you have a network-effect consumer business, you have this cold start problem.



HOFFMAN: Exactly. If scaling your product is ultimately dependent on having a large group of users, then you have a chicken and egg dilemma. The truly magical features we envisioned, simply couldn’t come to fruition until we had a dense network of users. We wanted to create such a vast reservoir of talent that a recruiter could say, “I’m looking for an accountant based in Biloxi, Mississippi who has a humanities degree plus 10 years of work experience and the capabilities to lead team-building events.” And I wouldn’t be surprised if you could find that dream candidate in just one click.



But it took years of clever hacks and grunt work to enable that sort of high-definition headhunting. And those valuable users just weren’t going to LOVE us straight out of the gate. So how do you get there? You work in batches, adding one narrow group of users at a time. Sam explains.



ALTMAN: You’ve got to find someone or some set of people that are going to use you a lot in the early days. And that may be a small, narrow-but-deep wedge, and then you expand it later.



And this is fine. We see this all the time with companies, where they start with some group of users that is not a particularly lucrative market—maybe not be the long-term users they want, but people, for whatever reason, can use the product a lot and get a lot of value out of it, and you use that as a bootstrap to create value for everybody else.



HOFFMAN: Another example is Facebook. When Facebook first launched, it was only for the students of a few colleges. It slowly expanded from Harvard to Columbia to Stanford, and beyond. But the ultimate way to scale was to go far beyond college students. Sam explains.



ALTMAN: In fact, Facebook—it turns out that their most profitable market is not students at the 10 most elite colleges. But those are people with a lot of time on their hands, they really cared about their social lives, they all had Internet access at a time when not everybody at that age did. And so it turned out to be a really good primer.



HOFFMAN: That’s right. Sometimes you can’t get to the millions of people who love you until you’re actually at a critical mass. Just like Facebook, LinkedIn had to find its initial users from somewhere.



The next generation of truly lovable ideas will look nothing like the previous generation. If you take a backward glance at Y Combinator’s most stellar graduates — Airbnb, Drobpox, Stripe — you’ll think they’ve mastered the app economy. And the assumption is that Y Combinator should stick to what they know.



Sam begs to differ.



ALTMAN: YC was mostly funding software companies but I had a lot of conviction that we could apply the same thing that made YC work so well for software companies to companies in a lot of the areas that I cared about: AI, synthetic biology, energy.



HOFFMAN: This may sound like a radical leap outside of Sam’s area of expertise. After all, you can’t build a supersonic jet on a shoestring budget. You can’t ask a user to hop into an experimental self-driving car and hope they come back in one piece to give you their feedback.



And when you think about the differences between apps and what is often called “hard tech”, you might be tempted to ask Sam, “What on earth are you doing?” In fact, Sam hears this a lot.



ALTMAN: But at the time it was like this is a really dumb thing. One of the things that is funny as a side note and just as a note to anyone that tries to do anything. Where you take a company in a different direction or scale it is that it is always funny to sort of like read the articles from the same journalists that when you say you’re going to do this thing say like, Sam is crazy, completely unqualified and not going to work, YC is going to die, going after hard tech companies is so stupid.



HOFFMAN: But to Sam, this leap into the unknown is completely consistent with Y Combinator’s mantra: Focus on love, not like.



To him, if a company is inventing something unheard of, you can ensure users will love it right from the proof of concept. Who wouldn’t love the invention of a supersonic jet? Or a self-driving car to battle through rush hour, while you flip through a magazine? Or a cold fusion energy plants that simultaneously make energy cheap and solve climate change?



ALTMAN: One company that you and I were talking about recently is this company called Boom; they’re making a supersonic airplane. And they really have lit up people’s imagination, and people really want it. People really love the idea of going to Japan in a few hours instead of 10 hours from San Francisco.



HOFFMAN: Boom Technology, the supersonic jet company, graduated from Y Combinator in 2016. One year later they raised $51 million in venture capital.



Here’s the magic of tackling the seemingly insoluble engineering problems. People fall in love with your idea alone. Take, for instance, Boom.



ALTMAN: It is harder for sure to make a Mach 2.2 airplane than a Mach 0.95 airplane, but it is easier in the sense that people care. People want to be part of it, people are excited. People pay attention. The CEOs of large airlines decide to come visit you. And that’s what we see, again and again.



HOFFMAN: That so-called “hard tech?” Sam says it’s easy.



ALTMAN: This is why I tell people that, in many ways, it is easier to start a hard company than an easy company.



HOFFMAN: So ironically, it may be harder to start an easy company. And easier to start a hard company. They’re just so lovable.



And now Sam notes with wry amusement that in a span of 14 months, press coverage flipped from scornful to glowing.



ALTMAN: Like Sam is a genius, it is like predestined, he was going to take over YC.



I think you have to ignore all that and just say like I have a high level conviction and we’re going to try this thing. And most people will tell you it’s not going to work. If it’s something new. Most people are afraid of things that are new and you just do it. It’s probably not that risky. Probably won’t kill the company and probably undervalue if everyone else says its stupid. So we were able to do that. And the first thing was expand YC into all these different directions. I think the greatest companies are created on kind of the bleeding edge of what people are working on.



HOFFMAN: And when you think about it, this brings Sam one step closer to expanding his collection of engineering milestones.



It’s only at the bleeding edge of innovation that you can discover a product that makes you say:



ALTMAN: It’s stunning, perfect. And so I was like so excited. I had just got this, I’d been waiting for it for so long.



HOFFMAN: I’m Reid Hoffman. Thank you for listening.",
            title: "Why customer love is all you need",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: podcast
          }
        ]
      },
      {
        username: nil,
        url:"https://www.youtube.com/",
        platform: youtube,
        media: [
          {
            url: "https://www.youtube.com/watch?v=ZoqgAy3h4OM&list=PL11qn6zM2Y3aK3gGWZSaadL8HTZE2_6-U&index=1",
            content: nil,
            title: "How and Why to Start A Startup",
            header: "Y Combinator president Sam Altman knows: It's better to have 100 users love you than 1 million kinda like you. The true seed of scale is love, and you can't buy it, hack it, or game it. A product that is deeply loved is one that can scale. ",
            format: video
          }
        ]
      }
    ]
  },

  # Influencer 8 : Benedict Evans

  {
    name: 'Benedict Evans',
    bio: "I work at Andreessen Horowitz ('a16z'), a venture capital firm in Silicon Valley that invests in technology companies. I try to work out what's going on and what will happen next.",
    accounts: [
      {
        username: "benedictevans",
        url:"https://twitter.com/benedictevans",
        platform: twitter,
        media: []
      },
      {
        username: nil,
        url:"https://www.ben-evans.com/benedictevans/",
        platform: blog,
        media: [
          {
            url: "https://www.ben-evans.com/benedictevans/2019/2/5/cameras-that-understand",
            content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            title: "Cameras that understand: portrait mode and Google Lens",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: article
          }
        ]
      },
      {
        username: nil,
        url:"https://www.ben-evans.com/benedictevans/",
        platform:blog,
        media: [
          {
            url: "https://soundcloud.com/a16z/a16z-podcast-everything-you-need-to-know-about-amazon",
            content: nil,
            title: "Everything You Need to Know About Amazon",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: podcast
          }
        ]
      },
      {
        username: nil,
        url:"https://www.youtube.com/",
        platform: youtube,
        media: [
          {
            url: "https://www.youtube.com/watch?v=RF5VIwDYIJk",
            content: nil,
            title: "The End of the Beginning",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: video
          }
        ]
      }
    ]
  },

  # Influencer 9 : Reid Hoffman

  {
    name: 'Reid Hoffman',
    bio: "Reid Garrett Hoffman is an American internet entrepreneur, venture capitalist and author. Hoffman was the co-founder and executive chairman of LinkedIn. He is currently a partner at the venture capital firm Greylock Partners.",
    accounts: [
      {
        username: "reidhoffman",
        url:"https://twitter.com/reidhoffman",
        platform: twitter,
        media: []
      },
      {
        username: nil,
        url:"https://www.reidhoffman.org/",
        platform: blog,
        media: [
          {
            url: "https://hbr.org/2019/03/educating-the-next-generation-of-leaders#learn-from-people-not-classes",
            content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            title: "Learn from People, Not Classes",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: article
          }
        ]
      },
      {
        username: nil,
        url:"https://mastersofscale.com/",
        platform: external_blog,
        media: [
          {
            url: "https://rss.art19.com/episodes/f7484bf4-8e1e-4c59-bc47-a4e761805991.mp3",
            content: nil,
            title: "The Reid Hoffman Story (Part 2) — Make everyone a hero",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: podcast
          }
        ]
      },
      {
        username: nil,
        url:"https://www.youtube.com/",
        platform: youtube,
        media: [
          {
            url: "https://www.youtube.com/watch?v=J-4J9gP1pIo",
            content: nil,
            title: "The secrets of Blitzscaling",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: video
          }
        ]
      }
    ]
  },

  # Influencer 10 : Tim O'Reilly

  {
    name: "Tim O'Reilly",
    bio: "Tim has a history of convening conversations that reshape the computer industry. In 1998, he organized the meeting where the term “open source software” was agreed on, and helped the business world understand its importance. In 2004, with the Web 2.0 Summit, he defined how “Web 2.0” represented not only the resurgence of the web after the dot com bust, but a new model for the computer industry, based on big data, collective intelligence, and the internet as a platform.",
    accounts: [
      {
        username: "timoreilly",
        url:"https://twitter.com/timoreilly",
        platform: twitter,
        media: []
      },
      {
        username: nil,
        url:"https://www.oreilly.com/tim/",
        platform: blog,
        media: [
          {
            url: "https://evonomics.com/new-economy-evolution-oreilly-wilson/",
            content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            title: "Evolving the New Economy: Tim O’Reilly and David Sloan Wilson",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: article
          }
        ]
      },
      {
        username: nil,
        url:"https://after-on.com/episodes/",
        platform: external_blog,
        media: [
          {
            url: "https://html5-player.libsyn.com/embed/episode/id/5824897/height/90/theme/custom/thumbnail/yes/direction/backward/render-playlist/no/custom-color/87A93A/",
            content: nil,
            title: "Tech's Past & Future",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: podcast
          }
        ]
      },
      {
        username: nil,
        url:"https://www.youtube.com/",
        platform: youtube,
        media: [
          {
            url: "https://www.youtube.com/watch?v=xRmQTWpkaVU",
            content: nil,
            title: "Why we'll never run out of jobs",
            header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus.",
            format: video
          }
        ]
      }
    ]
  },
]

full_list.each do |influencer|

  # influencer[:name]
  # influencer[:bio]

  this_influencer = Influencer.create! name: influencer[:name], bio: influencer[:bio]

  accounts = influencer[:accounts]


  accounts.each do |account|

    # account[:username]
    # account[:url]
    # account[:platform]

    this_account = Account.create! username: account[:username], url: account[:url], platform: account[:platform], influencer: this_influencer

    media = account[:media]

    media.each do |medium|

      # medium[:title]
      # medium[:content]
      # medium[:url]
      # medium[:format]

      this_medium = Medium.create! title: medium[:title], content: medium[:content], url: medium[:url], format: medium[:format], influencer: this_influencer, platform: this_account.platform
    end
  end
end

puts 'Database created'

## --------------------------------------------------------------------------------

  # # Influencer # : Influencer_name

  # {
  #   name: '',
  #   bio: "",
  #   accounts: [
  #     {
  #       username: "",
  #       url:"",
  #       platform: ,
  #       media: [
  #         {
  #           url: "",
  #           content: ,
  #           title: ,
  #           format:
  #         }
  #       ]
  #     },
  #     {
  #       username: ,
  #       url:"",
  #       platform: ,
  #       media: [
  #         {
  #           url: "",
  #           content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
  #           title: "",
  #           format:
  #         }
  #       ]
  #     },
  #     {
  #       username: ,
  #       url:"",
  #       platform: ,
  #       media: [
  #         {
  #           url: "",
  #           content: ,
  #           title: "",
  #           format:
  #         }
  #       ]
  #     },
  #     {
  #       username: ,
  #       url:"",
  #       platform: ,
  #       media: [
  #         {
  #           url: "",
  #           content: ,
  #           title: "",
  #           format:
  #         }
  #       ]
  #     }
  #   ]
  # },



# # -------------------------------------------------------------------------------

# # Creating each type of platforms

# puts 'Creating platforms list'
# platforms_list = [
#   {name: "Twitter", weight: 1.0},
#   {name: "Blog", weight: 1.0},
#   {name: "Newsletter", weight: 1.0},
#   {name: "Medium", weight: 1.0}
# ]
# platforms_list.each {|platform| Platform.create!(name: platform[:name], weight: platform[:weight])}


# # Creating each type of medium format

# puts 'Creating formats list'
# formats_list = [
#   {type_of: "article", weight: 1.0},
#   {type_of: "tweet", weight: 0.25},
#   {type_of: "podcast", weight: 1.0},
#   {type_of: "video", weight: 1.0}
# ]
# formats_list.each {|format_type| Format.create!(type_of: format_type[:type_of], weight: format_type[:weight])}


# # Creating list of tech influencers

# puts 'Creating influencers list'
# influencers_list = [
#   {name: "Paul Graham", bio: "Programmer, writer, and investor. In 1995, he and Robert Morris started Viaweb, the first software as a service company. Viaweb was acquired by Yahoo in 1998, where it became Yahoo Store. In 2001 he started publishing essays on paulgraham.com, which in 2015 got 34 million page views. In 2005 he and Jessica Livingston, Robert Morris, and Trevor Blackwell started Y Combinator, the first of a new type of startup incubator. Since 2005 Y Combinator has funded over 1000 startups, including Dropbox, Airbnb, Stripe, and Reddit."},
#   {name: "Brian Balfour", bio: "Founder/CEO of Reforge, previously VP Growth @ HubSpot. Brian Balfour has started multiple VC backed companies, and grown user bases to millions of daily active users. He writes detailed essays on growth and user acquisition that have been featured in Forbes, Hacker Monthly, and OnStartups to help build a growth machine."},
#   {name: "Andrew Chen", bio: "Investor at Andreessen Horowitz, where he focuses on consumer products, marketplaces, and bottoms up SaaS. Previously, he led growth teams at Uber."},
#   {name: "Marc Andreessen", bio: "Marc Andreessen is a cofounder and general partner of the venture capital firm Andreessen Horowitz. He is an innovator and creator, one of the few to pioneer a software category used by more than a billion people and one of the few to establish multiple billion-dollar companies. \n
#     Marc co-created the highly influential Mosaic Internet browser and co-founded Netscape, which later sold to AOL for $4.2 billion. He also co-founded Loudcloud, which as Opsware, sold to Hewlett-Packard for $1.6 billion. He later served on the board of Hewlett-Packard from 2008 to 2018."},
#   {name: "Benedict Evans", bio: "I work at Andreessen Horowitz ('a16z'), a venture capital firm in Silicon Valley that invests in technology companies. I try to work out what's going on and what will happen next."}
#   {name: "Chris Dixon", bio: "Chris Dixon (born 1972) is an American internet entrepreneur and investor. He is a general partner at the venture capital firm Andreessen Horowitz, and previously worked at eBay. He is also the co-founder and former CEO of Hunch."},
#   {name: "James Currier", bio: "James is one of Silicon Valley’s foremost experts in growth and network effects. He's a four-time serial entrepreneur. He is also a pioneer of user-generated models, viral marketing, a/b testing, crowdsourcing, and myriad other growth techniques now followed by nearly all technology companies."},
#   {name: "Sam Altman", bio: "Sam Altman is an American entrepreneur, investor, programmer, and blogger. He is the president of Y Combinator and co-chairman of OpenAI."},
#   {name: "Reid Hoffman", bio: "Reid Garrett Hoffman is an American internet entrepreneur, venture capitalist and author. Hoffman was the co-founder and executive chairman of LinkedIn. He is currently a partner at the venture capital firm Greylock Partners."},
#   {name: "Tim O'Reilly", bio: "Tim has a history of convening conversations that reshape the computer industry. In 1998, he organized the meeting where the term “open source software” was agreed on, and helped the business world understand its importance. In 2004, with the Web 2.0 Summit, he defined how “Web 2.0” represented not only the resurgence of the web after the dot com bust, but a new model for the computer industry, based on big data, collective intelligence, and the internet as a platform."},
#   {name: "Connie Chan", bio: "Connie Chan is a general partner at Andreessen Horowitz where she focuses on consumer tech investments. Since joining the firm in 2011, Connie has worked on the investment team sourcing consumer tech deals including Pinterest and Lime and worked closely with startups across the portfolio."},
# ]
# influencers_list.each {|influencer| Influencer.create!(name: influencer[:name], bio: influencer[:bio])}


# # Linking influencers account with each platform's type

# puts 'Creating accounts list'
# twitter = Platform.find_by name: "Twitter"
# blog = Platform.find_by name: "Blog"

# influencer = Influencer.find_by name: "Paul Graham"
# accounts_list = [
#   {username: "paulg", url:"https://twitter.com/paulg", platform: twitter, influencer: influencer},
#   {username: nil, url:"http://paulgraham.com/", platform: blog, influencer: influencer},
# ]
# accounts_list.each {|account| Account.create!(username: account[:username], url: account[:url], platform: account[:platform], influencer: account[:influencer])}


# # Creating a list of media for each influencer

# puts 'Creating media list'
# article = Format.find_by type_of: "article"
# tweet = Format.find_by type_of: "tweet"
# media_list = [
#   {url: "http://paulgraham.com/sun.html", content: "The most valuable insights are both general and surprising. F = ma for example. But general and surprising is a hard combination to achieve. That territory tends to be picked clean, precisely because those insights are so valuable.\n
# Ordinarily, the best that people can do is one without the other: either surprising without being general (e.g. gossip), or general without being surprising (e.g. platitudes).\n
# Where things get interesting is the moderately valuable insights. You get those from small additions of whichever quality was missing. The more common case is a small addition of generality: a piece of gossip that's more than just gossip, because it teaches something interesting about the world. But another less common approach is to focus on the most general ideas and see if you can find something new to say about them. Because these start out so general, you only need a small delta of novelty to produce a useful insight.\n
# A small delta of novelty is all you'll be able to get most of the time. Which means if you take this route, your ideas will seem a lot like ones that already exist. Sometimes you'll find you've merely rediscovered an idea that did already exist. But don't be discouraged. Remember the huge multiplier that kicks in when you do manage to think of something even a little new.\n
# Corollary: the more general the ideas you're talking about, the less you should worry about repeating yourself. If you write enough, it's inevitable you will. Your brain is much the same from year to year and so are the stimuli that hit it. I feel slightly bad when I find I've said something close to what I've said before, as if I were plagiarizing myself. But rationally one shouldn't. You won't say something exactly the same way the second time, and that variation increases the chance you'll get that tiny but critical delta of novelty.\n
# And of course, ideas beget ideas. (That sounds familiar.) An idea with a small amount of novelty could lead to one with more. But only if you keep going. So it's doubly important not to let yourself be discouraged by people who say there's not much new about something you've discovered. 'Not much new' is a real achievement when you're talking about the most general ideas.\n
# It's not true that there's nothing new under the sun. There are some domains where there's almost nothing new. But there's a big difference between nothing and almost nothing, when it's multiplied by the area under the sun.", title: "General and Surprising", influencer: influencer, format: article, platform: blog},
#   {url: "https://twitter.com/paulg/status/1099648921180217345", content: nil, title: nil, influencer: influencer, format: tweet, platform: blog}
# ]
# media_list.each {|medium| Medium.create!(url: medium[:url], content: medium[:content], title: medium[:title], influencer: medium[:influencer], format: medium[:format], platform: medium[:platform])}


# # puts 'Creating states list'
# # states_list = []


