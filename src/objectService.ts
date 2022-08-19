export function compareJson(obj1: any | any[], obj2: any | any[]): boolean {
  if (obj1 === obj2) {
    return true;
  }

  if (typeof obj1 === 'object' && typeof obj1 === typeof obj2) {
    let result = true;
    Object.entries(obj1).forEach(([key, val]) => {
      if (
        (!Array.isArray(val) && typeof val !== 'object' && obj2[key] !== val) ||
        (Array.isArray(val) && val?.length !== obj2[key]?.length)
      ) {
        result = false;
      } else if (Array.isArray(val)) {
        const arr = obj2[key];
        result =
          val.some((childObj1) =>
            // eslint-disable-next-line @typescript-eslint/ban-ts-comment
            // @ts-ignore
            arr.some((childObj2) => compareJson(childObj1, childObj2)),
          ) || val.length === 0;
      } else {
        result = compareJson(val, obj2[key]);
      }
    });

    return result;
  }
  if (Array.isArray(obj1)) {
    if (!Array.isArray(obj2) || obj2?.length !== obj1?.length) {
      return false;
    }

    return obj1.some((childObj1) =>
      obj2.some((childObj2) => compareJson(childObj1, childObj2)),
    );
  }

  return true;
}
