# your code goes here
class Person
    attr_reader :name
    attr_accessor :bank_account
    MAX_LIMIT = 10.freeze
    MIN_LIMIT = 0.freeze
    BATH_BOOST = 4.freeze
    WORK_OUT_BOOST = 2.freeze
    WORK_OUT_SMELL = 3.freeze
    PHONE_CALL_BOOST = 3.freeze
    CONVERSATIONS = {
        "politics" => "blah blah partisan blah lobbyist",
        "weather"  => "blah blah sun blah rain",
        "other"    => "blah blah blah blah blah"
    }.freeze

    def initialize(name)
        @name = name
        @bank_account = 25
        @happiness = 8
        @hygiene = 8
    end

    def happiness
        @happiness
    end

    def happiness=(value)
        @happiness = get_limited_value(value)
    end

    def hygiene
        @hygiene
    end

    def hygiene=(value)
        @hygiene = get_limited_value(value)
    end

    def happy?
        value_is_good?(@happiness)
    end

    def clean?
        value_is_good?(@hygiene)
    end

    def get_paid(amount)
        @bank_account = @bank_account + amount
        "all about the benjamins"
    end

    def take_bath
        self.hygiene = @hygiene + BATH_BOOST
        '♪ Rub-a-dub just relaxing in the tub ♫'
    end

    def work_out
        self.hygiene = @hygiene - WORK_OUT_SMELL
        self.happiness = @happiness + WORK_OUT_BOOST
        '♪ another one bites the dust ♫'
    end

    def call_friend(friend)
        self.happiness = get_phone_happiness(@happiness)
        friend.happiness = get_phone_happiness(friend.happiness)
        "Hi #{friend.name}! It's #{self.name}. How are you?"
    end

    def start_conversation(person, topic)
        self.happiness = self.happiness + get_conversation_happiness_change(topic)
        person.happiness = person.happiness + get_conversation_happiness_change(topic)
        get_conversation(topic)
    end

    private

    def get_limited_value(value)
        limited_value = 0
        if value > MAX_LIMIT
            limited_value = MAX_LIMIT
        elsif value >= MIN_LIMIT and value <= MAX_LIMIT
            limited_value = value
        elsif value < MIN_LIMIT
            limited_value = MIN_LIMIT
        end
        return limited_value
    end

    def value_is_good?(value)
        value > 7
    end

    def get_phone_happiness(value)
        value + PHONE_CALL_BOOST
    end

    def get_conversation(topic)
        case topic
        when "politics"
            "blah blah partisan blah lobbyist"
        when "weather"
            "blah blah sun blah rain"
        else
            "blah blah blah blah blah"
        end
    end

    def get_conversation_happiness_change(topic)
        case topic
        when "politics"
            -2
        when "weather"
            1
        else
            0
        end
    end
end