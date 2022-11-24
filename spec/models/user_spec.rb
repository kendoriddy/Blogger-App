require 'rails_helper'

describe User, type: :model do
    subject { User.new(name: 'Kenny', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Site supervisor at Homlan, UK', posts_counter: 0) }

    it 'name should be present' do
        expect(subject).to be_valid
    end

    it 'name should not be omited' do
        subject.name = nil
        expect(subject).to_not be_valid
    end

    it 'posts_counter should be greater than or equal to 0' do
        subject.posts_counter = -1
        expect(subject).to_not be_valid
    end

    it 'posts_counter should be set to 0 by default' do
        expect(subject.posts_counter).to eq 0
        expect(subject).to be_valid
    end

    it 'should return 3 most recent posts' do
        expect(subject).to respond_to(:recent_three)
    end
end