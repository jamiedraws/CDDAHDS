using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CDDAHDS.Navigation
{
    public class Sitemap
    {
        /// <summary>
        /// Represents a complete, collection of destinations for a single website 
        /// </summary>
        public NavigationList SitemapList;
        /// <summary>
        /// A dictionary of all destinations and landmarks for a single website
        /// </summary>
        public Sitemap()
        {
            SitemapList = new NavigationList();

            // Home
            SitemapList.AddItem(new NavigationItem
            {
                Id = "home",
                Name = "Home",
                Page = "Index",
                Hash = "#main"
            });

            // FAQ
            SitemapList.AddItem(new NavigationItem
            {
                Id = "faq",
                Name = "FAQ",
                Page = "FAQ",
                Hash = "#main"
            });

            
            // Reviews
            SitemapList.AddItem(new NavigationItem
            {
                Id = "reviews",
                Name = "Reviews",
                Page = "Reviews",
                Hash = "#main"
            });

            // Customer Service
            SitemapList.AddItem(new NavigationItem
            {
                Id = "customer-service",
                Name = "Contact Us",
                Page = "https://www.armandhammer.com/contact-us",
                IsExternal = true
            });

            // Shipping Policy
            SitemapList.AddItem(new NavigationItem
            {
                Id = "shipping-policy",
                Name = "Shipping Policy",
                Page = "Shipping-Policy",
                Hash = "#main"
            });

            // Return Policy
            SitemapList.AddItem(new NavigationItem
            {
                Id = "return-policy",
                Name = "Return Policy",
                Page = "Return-Policy",
                Hash = "#main"
            });

            // Security Policy
            SitemapList.AddItem(new NavigationItem
            {
                Id = "security-policy",
                Name = "Security Policy",
                Page = "Security-Policy",
                Hash = "#main"
            });

            // Privacy Policy
            SitemapList.AddItem(new NavigationItem
            {
                Id = "privacy-policy",
                Name = "Privacy Policy",
                Page = "https://churchdwight.com/privacy-policy.aspx",
                IsExternal = true
            });

            // Site Map
            SitemapList.AddItem(new NavigationItem
            {
                Id = "sitemap",
                Name = "Site Map",
                Page = "SiteMap",
                Hash = "#main"
            });

            // Order Now
            SitemapList.AddItem(new NavigationItem
            {
                Id = "order-now",
                Name = "Order Now",
                Hash = "#order"
            });

            // Products
            //SitemapList.AddItem(new NavigationItem
            //{
            //    Id = "products",
            //    Name = "Products",
            //    Page = "Index",
            //    Hash = "#products",
            //    ApplyHash = true
            //});

            // Where To Buy
            //SitemapList.AddItem(new NavigationItem
            //{
            //    Id = "buy",
            //    Name = "Where To Buy",
            //    Page = "Index",
            //    Hash = "#buy",
            //    ApplyHash = true
            //});

            // Our Mission
            SitemapList.AddItem(new NavigationItem
            {
                Id = "mission",
                Name = "Our Mission",
                Page = "https://www.armandhammer.com/en/about-us",
                IsExternal= true
            });

            // FAQ
            SitemapList.AddItem(new NavigationItem
            {
                Id = "faq",
                Name = "FAQs",
                Page = "FAQ",
                Hash = "#main"
            });

            // Terms + Conditions
            SitemapList.AddItem(new NavigationItem
            {
                Id = "terms",
                Name = "Terms + Conditions",
                Page = "Terms",
                Hash = "#main"
            });
        }

    }
}