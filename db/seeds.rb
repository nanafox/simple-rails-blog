post = Article.create(
  title: "A Blog Post with 1000 comments", body: "This post has 1000 comments. This whole idea is to test how fast deletion works after implementing a background job to handle it and return immediately to the user.", status: "public",
)

1000.times do |x|
  post.comments.create(
    commenter: "Commenter #{x + 1}", body: "This is comment #{x + 1}",
    status: "public",
  )
end

# Create 10 blog posts with longer, detailed content
posts = [
  {
    title: "Mastering Ruby on Rails for Web Development",
    body: "Ruby on Rails is an open-source framework that has revolutionized web development. Known for its convention over configuration approach, Rails allows developers to quickly create scalable and maintainable web applications. Whether you're building a simple blog or a complex e-commerce platform, Ruby on Rails provides the tools you need to succeed.",
    status: "public"
  },
  {
    title: "Understanding APIs: The Backbone of Modern Apps",
    body: "APIs (Application Programming Interfaces) are the invisible bridges that connect applications, enabling them to communicate and share data. From REST to GraphQL, APIs power everything from mobile apps to IoT devices. In this post, we'll explore the basics of APIs, why they matter, and how you can create your own to enhance your applications.",
    status: "public"
  },
  {
    title: "The Future of Web Development in 2024 and Beyond",
    body: "The landscape of web development is ever-changing. With the rise of AI-powered tools, serverless architecture, and new front-end frameworks, developers must stay on their toes to keep up. This article dives into the emerging trends, technologies, and practices that are shaping the future of the web. It's an exciting time to be a developer!",
    status: "public"
  },
  {
    title: "Getting Started with JavaScript Frameworks",
    body: "JavaScript frameworks have become essential for modern web development. From React to Vue.js and Angular, these tools simplify the process of building dynamic, interactive interfaces. In this post, we’ll compare popular frameworks and help you choose the right one for your next project.",
    status: "public"
  },
  {
    title: "A Beginner's Guide to Cloud Computing",
    body: "Cloud computing has transformed how we store data and run applications. Services like AWS, Google Cloud, and Azure provide scalable infrastructure for businesses and developers alike. Learn how to leverage the cloud to boost efficiency and reduce costs.",
    status: "public"
  },
  {
    title: "Why You Should Care About Cybersecurity",
    body: "As technology evolves, so do cyber threats. This article explores the basics of cybersecurity, common vulnerabilities, and best practices to keep your systems and data secure. Don't wait until it's too late—start protecting your digital assets today.",
    status: "public"
  },
  {
    title: "Exploring the World of DevOps",
    body: "DevOps is more than a buzzword; it's a culture that bridges the gap between development and operations teams. By adopting DevOps practices, you can streamline your workflows, improve collaboration, and accelerate your development lifecycle.",
    status: "public"
  },
  {
    title: "An Introduction to Data Structures and Algorithms",
    body: "Data structures and algorithms are the foundation of computer science. This guide provides a beginner-friendly overview of essential concepts like arrays, linked lists, and sorting algorithms. Whether you’re preparing for interviews or building projects, this knowledge is invaluable.",
    status: "public"
  },
  {
    title: "Building Scalable Microservices",
    body: "Microservices architecture has gained popularity for its scalability and flexibility. This article explains the principles of microservices, the benefits they offer, and how to design a microservices-based system for your applications.",
    status: "public"
  },
  {
    title: "Harnessing the Power of AI in Web Development",
    body: "Artificial intelligence is reshaping web development. From chatbots to personalized user experiences, AI technologies can take your applications to the next level. Discover how to integrate AI into your web projects and stay ahead in this competitive field.",
    status: "public"
  }
]

# Create the posts and add comments with detailed feedback
posts.each_with_index do |post_data, index|
  post = Article.create(post_data)

  # Add 3 comments to each post
  3.times do |x|
    post.comments.create(
      commenter: "Commenter #{index + 1}-#{x + 1}",
      body: "Great insights in '#{post_data[:title]}'. The section on #{post_data[:body].split(". ").first.downcase} was particularly helpful. Looking forward to more posts like this!",
      status: "public",
    )
  end
end
