namespace EventEase.Services;

public class UserSessionService
{
    public string? CurrentUser { get; private set; }
    public bool IsLoggedIn => !string.IsNullOrEmpty(CurrentUser);

    public event Action? OnUserChanged;

    public void Login(string userName)
    {
        CurrentUser = userName;
        OnUserChanged?.Invoke();
    }

    public void Logout()
    {
        CurrentUser = null;
        OnUserChanged?.Invoke();
    }
}