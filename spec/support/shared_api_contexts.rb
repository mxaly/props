shared_context 'a successful JSON request' do
  it 'returns an OK (200) status code' do
    expect(response.status).to eq(200)
    expect(response.content_type).to eq 'application/json'
  end
end
