using EventEase.Models;

namespace EventEase.Services;

public class EventService
{
    private readonly List<Event> _events = new()
    {
        new Event { Id = 1, Title = "Tech Conference", Description = "Annual technology conference", Date = DateTime.Now.AddDays(30), Location = "Convention Center" },
        new Event { Id = 2, Title = "Workshop", Description = "Blazor development workshop", Date = DateTime.Now.AddDays(15), Location = "Training Room" }
    };

    public List<Event> GetEvents() => _events;

    public Event? GetEvent(int id) => _events.FirstOrDefault(e => e.Id == id);

    public void AddEvent(Event eventItem)
    {
        eventItem.Id = _events.Count > 0 ? _events.Max(e => e.Id) + 1 : 1;
        _events.Add(eventItem);
    }

    public void UpdateEvent(Event eventItem)
    {
        var existing = GetEvent(eventItem.Id);
        if (existing != null)
        {
            existing.Title = eventItem.Title;
            existing.Description = eventItem.Description;
            existing.Date = eventItem.Date;
            existing.Location = eventItem.Location;
            existing.MaxAttendees = eventItem.MaxAttendees;
        }
    }

    public bool RegisterUser(int eventId, string userName)
    {
        var eventItem = GetEvent(eventId);
        if (eventItem != null && eventItem.RegisteredUsers.Count < eventItem.MaxAttendees && !eventItem.RegisteredUsers.Contains(userName))
        {
            eventItem.RegisteredUsers.Add(userName);
            return true;
        }
        return false;
    }
}