class HomePage
  include PageObject

  page_url "localhost:4568/"

  h1(:top_heading, :id => 'top_heading')
end