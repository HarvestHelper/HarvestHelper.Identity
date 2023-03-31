using HarvestHelper.Identity.Service.Dtos;
using HarvestHelper.Identity.Service.Entities;

namespace HarvestHelper.Identity.Service
{
    public static class Extensions
    {
        public static UserDto AsDto(this ApplicationUser user)
        {
            return new UserDto(
                user.Id,
                user.UserName,
                user.Email,
                user.CreatedOn);
        }
    }
}