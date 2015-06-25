shared_examples "the snippet doesn't have a star yet" do
  it "return unstarred JSON response" do
    put :star, :id => generic_snippet.id
    json_response = JSON.parse(response.body)
    expect(json_response["starred"]).to be_truthy
  end
end

shared_examples "the snippet already has a star" do
  it "return starred JSON response" do
    expect(generic_snippet).to receive(:toggle_star).and_return(false)
    put :star, :id => generic_snippet.id
    json_response = JSON.parse(response.body)
    expect(json_response["starred"]).to be_falsy
  end
end

