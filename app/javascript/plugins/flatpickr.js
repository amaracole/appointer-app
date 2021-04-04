import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
  altInput: true,
  enableTime: true,
  inline: true
});
}

export { initFlatpickr };
