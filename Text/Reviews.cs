using CDDAHDS.Models;
using System.Collections.Generic;

namespace CDDAHDS.Text
{
	public static class Reviews
	{
        public static string GetCustomerType(Review review)
        {
            string type = SubmittedCustomerReviews.IndexOf(review) > -1 ? "Verified Purchaser" : "Customer Review of Free Product";

            return string.Format("[{0}]", type);
        }

        public static List<Review> CustomerReviews = new List<Review>() {
            new Review
            {
                Blockquote = @"<p>I absolutely love the arm and hammer power sheets. Not only do they smell great but they get my cloths cleaner than my usual liquid detergent.</p>",
                Title = "Amazing product",
                Name = "Hillary S.",
                Stars = 5
            },
            new Review
            {
                Blockquote = @"<p>I tried the Arm and Hammer Power Sheets . I was a little weary of trying the sheets. but I won't go back to anything else. Everything smells amazing and so very easy to use. So much better than having empty plastic bottles to get rid of. Highly recommend these sheets.</p>",
                Title = "",
                Name = "Brandy M.",
                Stars = 5,
                Location = ReviewLocation.LandingPage
            },
            new Review
            {
                Blockquote = @"<p>I had never had any experience using a laundry detergent sheet before, in fact I didn't even know it existed. It was extremely easy to use just throwing a couple sheets into the washing machine depending on how big the load was. A lot more simple than lifting the heavy jug of liquid detergent or filling a cup and dumping it into the detergent slot. I was leery how it would work but it still lathered up in the machine really well and when the cycle was over the sheet had dissolved!</p>",
                Title = "Super convenient and worked well!",
                Name = "Jessica H.",
                Stars = 4,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>I really enjoyed using the Arm and Hammer Power Sheets. One thing I loved about this product is that it was very convenient and easy to use. I did not have to worry about bringing out my large detergent bottle, measuring out the right amount of detergent that I needed, instead I just had to grab a sheet of Arm and Hammer and throw it in my washing machine. My first impression of the product was how convenient, space saving and how good the scent smelled. {{ShowMore}}I used this product on my bedding and also my regular laundry. One con to this product was that I feel like the scent isn't strong after washing therefore I would still have to use my liquid fabric softener in the wash in order to get my desired clean scent. I do feel like the Arm and Hammer Power Sheets cleaned my laundry very well and met my expectations. I would recommend this product to everyone, but definitely recommend using liquid fabric softener along with this product if you like your clothes to have scent after washing and drying.
                </p>",
                Title = "Laundry Made Easy!",
                Name = "Amber O.",
                Stars = 4,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>The sheets come in an easy to use dispensing package. The sheets have a great aroma as well. The working power of the sheets is great as it left my clothes smelling clean and fresh and also fought stains off leaving everything stain free.</p>",
                Title = "Use these sheets for every load!",
                Name = "Roopak G.",
                Stars = 4,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>I received arm &amp; hammer power sheets free to try and give my honest opinion on them. No more bulky laundry jugs when you use the sheets. They smell amazing. They actually clean my clothes really good I was skeptical at 1st. Only thing I don't like after you dry your clothes they don't smell as fresh as when u put them in the wash. The amazing smell doesn't last long. :( maybe add some fabric softener would help. But over all a great product just wish the amazing smell lasted when clothes come out of dryer also. My clothes did come out and soft.
                </p>",
                Title = "Clean fresh look",
                Name = "Kasey C.",
                Stars = 4,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>The Power Sheets were very easy to use. I liked that there was perforation in the middle of the sheet, though it was not clear whether 1 sheet was the full sheet or the perforated half of sheet. Anyways, the sheets had a pleasant smell, were easy to use, and cleaned my clothes well. I tried it on a few clothes with stains and it worked well. Would use these again!</p>",
                Title = "Exciting new product",
                Name = "Will H.",
                Stars = 4,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>I love this laundry detergent sheets, they are so easy to use. I like that a medium load takes 1 sheet and a large load takes 2. They are the perfect size to travel with and use. They smell amazing and they clean my clothes very well. I like the convenience of them and how they don't take up any space in my laundry room.</p>",
                Title = "Love These!",
                Name = "Melanie D.",
                Stars = 5,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>I absolutely loved how easy to use this product was. It dissolves much better and more reliably than I have previously experienced when using products like laundry pods. My one point of criticism that lowered my rating to 4 stars is the scent. It was pleasant but overpowering when opening the box. Somehow the scent ended up being very faint on my clothes after washing and I would have enjoyed it being stronger at that point than it was.</p>",
                Title = "Convenient and easy to use",
                Name = "Dean P.",
                Stars = 4,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>I was excited to try the laundry sheets . In my mind if they worked well this was a safer , more convenient solution to keeping my clothes clean . When they arrived and I opened them up they had such a pleasant clean fragrance , were light weight and conveniently packaged . You use one sheet for normal loads and 2 sheets for larger loads . With the scent being so pleasant I wanted to try them without fabric softener . My sheets came out smelling great as if I had used fabric softener and they felt super clean as well . I am a huge fan no more lugging around heavy, messy laundry detergent or wearing about my 2 year old consuming a pod . Excited for these to launch so I can share with friends and family!</p>",
                Title = "Believer",
                Name = "Heather R.",
                Stars = 5,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>I tried the New Arm &amp; Hammer Laundry Detergent Sheet in the Fresh Linen scent. These sheets smell so good, I could smell them before I even opened the box they came in. It was strong, but that's good, that's the way I like anything I use for my laundry. This usually means the scent will last on the clean laundry for a while. The sheet come with a perforated line in the middle so you can break the sheet. You use a whole sheet for a Large load and a half sheet on smaller loads. I don't mind using the liquid laundry detergent, but these laundry sheets make the laundry process even easier than before. If you are someone that has to go to a laundromat to do your laundry, if you use these laundry sheets they are so much easier and not as heavy to just pack up to take to the laundromat with you. If you think about it a box of these New Arm &amp; Hammer Laundry Detergent Sheets basically looks just like a box of fabric softener sheets. I really like how simple they are and how easy they are to use. I'm not sure what other fragrances they will have, but this Fresh Linen smells Great. I would definitely buy this product. I would recommend to friends and family.</p>",
                Title = "Easy to Use Laundry Detergent Sheets",
                Name = "Marie K.",
                Stars = 5,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>I'm so impressed with the Arm &amp; Hammer Power Sheets. I wasn't sure what to expect but I can say it definitely did not disappoint! The fresh linen fragrance was so mesmerizing; you could smell it outside of the box. I really like the fact that it's a lightweight product instead of heavy detergent jugs and it's also environmentally friendly to not use plastic jugs. I highly recommend this product because it works very well! I used two whole sheets per one med-large laundry load and the clothes were cleaned well and smelled fresh. There was no residue found on the clothes. I am pleased with my experience and appreciate that it's a compact and eco-friendly!</p>",
                Title = "This a great eco-friendly product!",
                Name = "Sidra K.",
                Stars = 5,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>at first opening the box the scent was VERY appealing to me. I am a huge lover of a fresh clean scent and this had it. My first load of laundry was towels, I threw the sheet in and it didn't dissolve as fast as other sheets I have used. It seemed to clean good however when it finished washing as I took out to put in dryer I have had some detergents really smell good and I did not notice this. Also , when the sheet dissolved I noticed blue clumps in the water. I do love laundry sheets especially for vacation or when I travel, so easy to pack and doesn't take up a lot of space. My second and additional loads I was very pleased with how well the sheets worked. I would definitely buy these sheets.</p>",
                Title = "Very Pleased!",
                Name = "Karen W.",
                Stars = 4,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>I really liked the power sheets laundry detergent! It cleaned my clothes so well and made them smell so fresh and clean. My husband works in a factory and he gets his clothes very dirty and when I washed his load of clothes they was very clean! All of the dirt and even some of the stains was gone. I highly recommend getting the power sheets laundry detergent!</p>",
                Title = "Amazing Product!",
                Name = "Kayla F.",
                Stars = 5,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>I was able to smell the difference after the first load. Taking the clothes out of the washer to put into the dryer, you could smell the difference. Taking them out of the dryer, they got the clothes clean and still had a good fresh smell to them.
                </p>
                ",
                Title = "These washing machine detergent sheets make everything smell fresh and new.",
                Name = "Greg M.",
                Stars = 5,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>I'm super pleased with the results. I used the sheets on my linen, towels, underwear load and also on a delicate dresses load and everything came out perfectly. No need to use anything else just the sheets. I didn't even needed to use softener for towels or linens. They came out perfectly soft</p>",
                Title = "All in one sheets",
                Name = "Sofia N.",
                Stars = 5
            },
            new Review
            {
                Blockquote = @"<p>Arm &amp; Hammer Power Sheets are an excellent laundry detergent product from a storied company known for their quality and freshness. Arm &amp; Hammer Power Sheets save water, save space, are light, easy to use, and easily washes laundry that looks and smells fresh and clean!</p>",
                Title = "Arm &amp; Hammer Power Sheets are an excellent laundry detergent product from a storied company!",
                Name = "Joshua L.",
                Stars = 5,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>I absolutely love these laundry sheets, so easy to use and no mess! The scent is so fresh smelling and makes my clothes smell very clean and fresh!</p>",
                Title = "Love It!",
                Name = "Stephanie D.",
                Stars = 5
            },
            new Review
            {
                Blockquote = @"<p>When opening the box for the first time, I was instantly hit with an amazing scent. I love the scent of detergent, so I was happy that I thought this would make my clothing smell the same. Unfortunately, when I washed the clothes with the recommended sheet amount, it did not leave my clothes with the scent I was hoping for. I wish they were a bit stronger in that realm, but overall it is a great product. My clothes feel great, smell good even though I wish it was stronger &amp; I would definitely buy them if I saw them on shelves.</p>",
                Title = "Great product, but I wish the scent was stronger.",
                Name = "GB",
                Stars = 4,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>I love Arm and Hammer Power Sheets Laundry Detergent!! Let me begin by saying I'm already a laundry detergent sheets user but Arm and Hammer Power Sheets will be my new brand of choice! I do like the linen fragrance, it smells clean to me. The sheets are easy to break in half for a small load or sometimes you need a sheet and a half. I really appreciate the fact that all the trash I deal with when I'm finished is a small cardboard box, which takes up much less space than regular laundry detergent, another bonus for those of us with limited space. I hope more people start using this product, I highly recommend it!!</p>",
                Title = "Cathy L.",
                Name = "Love these detergent sheets!!",
                Stars = 5,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>I recently tried these arm and hammer laundry sheets, and I was very impressed! The first thing I liked is that they are easy to use, no spilling or carrying heavy jugs of detergent. Second is that each sheet comes with just the right amount of detergent for one load, this is so helpful because I feel like I always pour too much. I also hear that laundry sheets are more eco friendly which is another plus. They worked very well to clean, and my clothes came out nice and fresh. The only things I would say was that I wish the scent was a bit stronger, and it only did an okay job when I tested it on stains. Overall I would say this is such a great product- easy to use and super convenient. I however, would combine it with scent beads and stain removers.</p>",
                Title = "Loved It!",
                Name = "Lia S.",
                Stars = 4,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>They were very easy to use, you just throw them in! They smell nice but they don't leave your clothes smelling of perfume. I didn't really notice much of a smell on my clothes after using the product. They seemed to work well and I would definitely use them again.</p>",
                Title = "A new, easy way to wash clothes",
                Name = "Terry M.",
                Stars = 5,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>The overall usage of the Arm &amp; Hammer Power Sheets is so simple and easy! I like that I can toss a sheet or two into my washer along with items I want to wash. I don't have to worry about measuring detergent or counting pods. The scent of the sheets is really nice and makes your clothes smell nice and clean. It's not overpowering though! Items I have washed come out nice and clean. I have been very impressed compared to what I usually use. I'm definitely in the market to change detergents and this is one I would sue on a regular basis. Highly recommend!</p>",
                Title = "Switch to Sheets &amp; Measure No More!",
                Name = "Michael C.",
                Stars = 5,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>I recently tried out laundry detergent sheets and was extremely impressed with their performance. The first thing I noticed was the pleasant scent, which was very long-lasting and left my clothes smelling fresh and clean for days. The best part was that the scent wasn't overpowering or artificial, but rather a subtle aroma. Another great feature of these detergent sheets is the convenient sheet format. Unlike traditional liquid detergent bottles that take up a lot of space and can be messy to use, these sheets are compact and easy to store. Plus, there's no need to measure out the right amount of detergent, as each sheet is pre-measured and ready to go. I have to say, these sheets did not disappoint. I tested them out on clothes, bedsheets, and towels, and they worked just as well as any liquid detergent I've used in the past. They left my laundry looking and feeling clean and fresh, without any residue or buildup. Overall, I would highly recommend these laundry detergent sheets to anyone looking for a convenient, effective, and great-smelling laundry detergent option. They're a game-changer when it comes to doing laundry, and I'll definitely be using them again in the future.</p>",
                Title = "Goodbye Bulky Detergent Bottles!",
                Name = "Mira L.",
                Stars = 5,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>I tried the Arm and Hammer Power Sheets . I was a little weary of trying the sheets. but I won't go back to anything else. Everything smells amazing and so very easy to use. So much better than having empty plastic bottles to get rid of. Highly recommend these sheets.</p>",
                Title = "LOVE this",
                Name = "",
                Stars = 5,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>I do tons of laundry at our home. I have used it all from powder to liquid to pods. I have never used Laundry Sheets. These were easy to use as its just dropping sheets in the laundry machine. They smell great and leave a nice aroma on the clothing. No residue is seen on the clothing and they are left soft and as colorful as before.</p>",
                Title = "Unique and effective alternative",
                Name = "Adan U.",
                Stars = 5,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>My overall review is that it's one of the best selling products I've ever used on clothes. It definitely gets the job done and it makes you feel very refreshed. You don't have to worry about your clothes smelling bad and you didn't pop one easy to get the best results</p>",
                Title = "Best sheets to make your clothes smell goos",
                Name = "Lee",
                Stars = 4,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>I give this four out of five stars. It's not nearly as messy as detergent and to me this worked very well, it didn't fight all stains.</p>",
                Title = "Good product 4/5",
                Name = "Matthew L.",
                Stars = 4,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>I tried Arm &amp; Hammer Power Sheets. This product is a God send for me. I am Autistic and everything in life takes an extreme amount of focus. I usually make a mess with my liquid detergent but, with these drop in sheets, I had no issues gaining a little independence back. I would recommend my peers give it a try.</p>",
                Title = "Regain Independence",
                Name = "Devonte M.",
                Stars = 4,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>I was able to try the Arm and Hammer Power sheets 3 times and I was pretty impressed. First off I must say that I have never seen laundry sheets before so I am very intrigued by this idea and think it's genius.  The first thing I did when I opened the box was smell them and they smell great! Nice fresh and clean fragrance, but not too overpowering. I knew these were supposed to be used in the wash but I would recommend clear labeling and names on this product to ensure someone doesn't confuse them with dryer sheets. I washed a few different loads of items which included towels, clothes and a mixture and the results were consistent each time. When coming from the washer, they had a fresh smell and looked and smelled clean. After drying the clothes, they still looked clean, but the scent was very faint so my only reason for the 4 stars was that I'd like to smell the scent even after drying. Otherwise, I love how compact and easy to use these sheets are. It would also make traveling with the sheets easy since they are flat (for example, when going on a vacation to a vacation home where you may need detergent while there). I can see packs like this lasting me a lot longer than the current detergents I buy.</p>",
                Title = "Very pleasantly surprised by this product !",
                Name = "Ericka D.",
                Stars = 4,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>I like the overall idea and especially the  small amount of space it takes up. I was a little confused on the instructions. It said use one sheet for every load but the sheet had a seam where it could be torn into two pieces. So was the sheet one or two pieces?</p>",
                Title = "Great for small laundry places",
                Name = "Jessica H.",
                Stars = 4,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>Ok so I've used the Arm n Hammer laundry detergent sheets for 4 loads of laundry before coming here to tell you about it. I have to start by saying that first, I was skeptical because I've used Arm n Hammer detergent in the past (8 years maybe) and I wasn't too terribly impressed. But today I'm able to say that I was able to give it 4 out of 5 stars! They come out of the box at almost the same size but have little perforations to make it half the size so I started with half a sheet first. The first loaf with the half sheet came out clean but no fragrance. So the next load I used a whole sheet. Clean clothes, no fragrance but man were they soft! I mean I could feel the softness before I even put them in the dryer! So the the 3rd load had some very dirty clothes. Again they came out clean, soft again but I still couldn't smell anything. On the 4th load I used two whole sheets and on cleaning rags so this was the dirtiest load of all. Once again, clean and I mean clean! And very very soft and this time I  caught the fragrance! I'm the type that likes a little fragrance in her laundry soap. Helps me to know what's been washed and what hasn't sometimes.  I'm actually pretty impressed with these sheets. Ah, the wonder of science and invention. This old gal is pretty impressed honestly. Thank you</p>",
                Title = "Yeah, I'm impressed!",
                Name = "Mary F.",
                Stars = 4,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>I love the idea of sheets as opposed to traditional liquid detergent. However, I believe sheets still have a bit more perfectioning to go through. If there is a brand that could reach that perfecting level, it's arm &amp; hammer.</p>",
                Title = "Almost there",
                Name = "Carlos R.",
                Stars = 4,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>The Arm &amp; Hammer Power Sheets are an excellent choice to make your laundry feel soft and fresh. The Lavender &amp; Linen scent is particularly delightful, leaving both your laundry and laundry room smelling fantastic. These sheets not only eliminate static and wrinkles but also leave your laundry feeling incredibly soft. Even after folding and putting them away in your closets, your clothes retain their newfound softness and aroma. The fragrance is fresh and calming, making it a must-try for anyone who wants their laundry to smell great for days. I strongly suggest giving them a try.</p>",
                Title = "Smells amazing",
                Name = "Ari U.",
                Stars = 5,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>What a great product! I used these sheets for my every day work clothes and my home's linens. They did a great job washing off minor blemishes and deodorizing.  The scent was lovely but a little overpowering. Just walking by the laundry room smelled like the machine was on! Great if you're into strong smells, might want to consider getting a closed container if you prefer subtle scents. I still recommend this product as the sheets dissolved with no complications and did a great job cleaning. Thank you, Arm &amp; Hammer! </p>",
                Title = "Great product!",
                Name = "Norma V.",
                Stars = 4,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>I love this product! The sheets are very easy to use, mess free, and the best part is no big and bulky packaging. I liked the fragrance(and hopefully more fragrances) and they did a wonderful job of cleaning my clothes. I will definitely use this product over regular detergent.</p>",
                Title = "Very impressed",
                Name = "Barbara C.",
                Stars = 4,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>I tired the Arm and Hammer laundry power sheets. I liked it the fact that it have a scent to the sheets. If this product was in the stores I would buy it. Yes I would recommend  to a friend or family member</p>",
                Title = "Fresh and Clean",
                Name = "Shahala J",
                Stars = 4,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>The laundry sheets smell strong and powerful in the box. I would have liked the scent to transfer to my clothing a bit. I did like how clean my clothes were after. I would recommend it I would think maybe a bit more fragrance would have gotten five stars.</p>",
                Title = "Super Clean",
                Name = "AJ M",
                Stars = 4,
                Location = ReviewLocation.SubPage
            }
        };

		public static List<Review> SubmittedCustomerReviews = new List<Review>()
        {
            new Review
            {
                Blockquote = @"<p>I was a bit skeptical at first, but wow! They really work great and so much less space and waste. Love them!</p>",
                Title = "Works great!",
                Name = "Christine G.",
                Stars = 5
            },
            new Review
            {
                Blockquote = @"<p>So far I love them. I have very small loads and I love the perforated sheets for that purpose. Storage is very important too. Thank you.</p>",
                Title = "Power sheets",
                Name = "Betty H.",
                Stars = 5
            },
            new Review
            {
                Blockquote = @"<p>These power sheets are amazing! They smell clean, work well and are easy to handle. They come in a small box and that is it! Highly recommend!</p>",
                Title = "Super handy and works perfectly",
                Name = "Tonia F.",
                Stars = 5
            },
            new Review
            {
                Blockquote = @"<p>Excited to take the plunge into the incredible sheet laundry detergent.</p>
                <p>The smell is incredible and even better? They clean too!</p>
                <p>If you are a life time user of Arm&Hammer products, you will not be disappointed!</p>",
                Title = "Excited!",
                Name = "Peggy S.",
                Stars = 5
            },
            new Review
            {
                Blockquote = @"<p>I have tried the new laundry sheets for 3 different types of laundry and they clean very well.</p>",
                Title = "Love the new laundry sheets!",
                Name = "Juliana M.",
                Stars = 5
            },
            new Review
            {
                Blockquote = @"<p>Thank you for making the power sheets. Please sell them in stores and not just online. I am so glad to be rid of the big plastic jug. </p>",
                Title = "Power sheets",
                Name = "Rosalie V.",
                Stars = 5,
                Location = ReviewLocation.SubPage
            },
            new Review
            {
                Blockquote = @"<p>I like this product. Does great on laundry. Hope to be able to buy in stores.</p>",
                Title = "Power sheets",
                Name = "Joanne B.",
                Stars = 5,
                Location = ReviewLocation.SubPage
            },
        };
	}
}