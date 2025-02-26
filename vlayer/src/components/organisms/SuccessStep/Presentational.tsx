import { Link } from "react-router";

export const SuccessStepPresentational = ({
  isAdult,
  address,
}: {
  isAdult: boolean;
  address: string;
}) => {
  return (
    <>
      <p className="text-gray-500">
        {isAdult ? "You are an adult" : "You are not an adult"}
      </p>
      <p className="text-gray-500">
        {address}
      </p>
      <div className="mt-2 flex justify-center">
        <Link target="_blank" to="https://www.frisco.pl/stn,akcja-strefa_atrakcyjnych_cen_G3_2025/n,strefa_atrakcyjnych_cen_G3_2025?_gl=1*104dkak*_up*MQ..*_ga*OTcyMTkuMTc0MDUyODQ4NA..*_ga_N01VKB5M2C*MTc0MDUyODQ4My4xLjAuMTc0MDUyODQ4My4wLjAuMA..&kat165" id="nextButton">
          Make an order
        </Link>
      </div>
    </>
  );
};
