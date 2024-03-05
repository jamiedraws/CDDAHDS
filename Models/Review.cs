using CDDAHDS.Text;

namespace CDDAHDS.Models
{
    public class Review
    {
        /// <summary>
        /// Represents the body of the review
        /// </summary>
        public string Blockquote { get; set; }
        /// <summary>
        /// Represents the author name for the review
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// Represents the review title
        /// </summary>
        public string Title { get; set; }
        /// <summary>
        /// Represents the number of stars the author chose
        /// </summary>
        public int Stars { get; set; }
        /// <summary>
        /// Represents which page the review should be displayed on
        /// </summary>
        public ReviewLocation Location { get; set; }

        public Review()
        {
            Location = ReviewLocation.AnyPage;
        }
    }
}