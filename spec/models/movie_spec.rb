require 'rails_helper'

RSpec.describe Movie, type: :model do
  it "has a title" do
    movie = Movie.create(title: "Movie Title")
    expect(movie.title).to be_truthy
  end
end
